# CS390 HW4- awk script to calculate letters
# studentletters.awk
# Phil Jarrett, Spring 2016

BEGIN{
	print "-------------------------------------------------------------"	
	print "Student Name        Average        Letter Grade"
	print "-------------------------------------------------------------"

	error_state = 0;
}

/[0-9]/ {	class_size++;
	
			{for (x=1; x<=NF; x++)
				if ($x == "Q" || $x == "q") {quiz[$1] = $(x+1); sum_quiz += $(x+1)}

				else if ($x == "H" || $x == "h") {hw[$1] = $(x+1); sum_hw += $(x+1)}

				else if ($x == "E" || $x == "e") {exam[$1] = $(x+1); sum_exam += $(x+1)}

				else if ($x == "F" || $x == "f") {final[$1] = $(x+1); sum_final += $(x+1)}

			}


		}
	{for (name in quiz)
		
		average[name] = (quiz[name] * .1) + (hw[name] * .4) + (exam[name] * .2) + (final[name] * .3)
	}

$0 !~ /[Qq]/ {print $1, "is missing quiz grade."}


END{
	{ for (name in average)
		{
#Determine Letter Grade
			if (average[name] >= 97 && average[name] <= 100)  letter[name]="A+"
  					else if (average[name] >= 94 && average[name] <97 ) letter[name]="A"
  					else if (average[name] >= 90 && average[name] < 94) letter[name]="A-"
  					else if (average[name] >= 87 && average[name] < 90) letter[name]="B+"
  					else if (average[name] >= 84 && average[name] < 87) letter[name]="B"
  					else if (average[name] >= 80 && average[name] < 84) letter[name]="B-"
  					else if (average[name] >= 77 && average[name] < 80) letter[name]="C+"
  					else if (average[name] >= 74 && average[name] < 77) letter[name]="C"
					else if (average[name] >= 70 && average[name] < 74) letter[name]="C-"
					else if (average[name] >= 60 && average[name] < 70) letter[name]="D"
			print name, "\t\t", average[name], "\t\t\t", letter[name]
			sum_grade += average[name]
		}	
	}
	if (error_state == 0)
	{
		{print "Total number of students in class: ", class_size}
		{print "Class average of quiz: ", sum_quiz/class_size}
		{print "Class average of homework: ", sum_hw/class_size}
		{print "Class average of exam: ", sum_exam/class_size}
		{print "Class average of final exam: ", sum_final/class_size}
		{print "Class average grade:", sum_grade/class_size}
	}
	
	else if (error_state == 1)
	{
		{print "Class averages not calculated due to errors."}
	}

}