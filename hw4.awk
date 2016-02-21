# CS390 HW4- awk script to calculate student grades
# studentgrades.awk
# Phil Jarrett, Spring 2016

BEGIN{
	print "-------------------------------------------------------------"	
	print "Student Name        Average        Letter Grade"
	print "-------------------------------------------------------------"

	error_state = 0;
}

/[0-9]/ {	
		class_size++;

	for (i=2; i<=NF; i+=2){
		
		#Check for invalid grade type
		if($i!~/[QqEeHhFf]/){
			errors[$1]=  "****Wrong type: "$i  
			error_state = 1
			break
		}

		#Check for missing score
		if($(i+1) !~ /^[0-9]/ || length($(i+1)) == 0){
			errors[$1]= "****Missing score for: " $i
			error_state = 1
			break
		}

		#Check for missing score
		if($(i+1) > 100 || $(i+1) < 0){
			errors[$1]= "****Invalid grade: " $(i+1)
			error_state = 1
			break
		}

		#Read Quiz grades
		if($i ~/[Qq]/){
			quiz[$1] = $(i+1)
			class_quiz += $(i+1)
		}

		#Read Exam grades
		if($i ~/[Ee]/){
			exam[$1] = $(i+1)
			class_exam += $(i+1)
		}

		#Read Final grades
		if($i ~/[Ff]/){
			final[$1] = $(i+1)
			class_final += $(i+1)
		}

		#Read Homework grades
		if($i ~/[Hh]/){
			hw[$1] = $(i+1)
			class_hw += $(i+1)
		}
	}
}		

END{
	#Print student grades
		
	for (name in quiz){

		#Calculate weighted average for each student
		average[name] = (quiz[name] * .1) + (hw[name] * .4) + (exam[name] * .2) + (final[name] * .3)
		class_grade += average[name]

		if(errors[name] ~ /[A-Za-z]/){
			print name ":" errors[name]
		}

		else{
			print name "\t\t" average[name] "\t\t" grade2letter(average[name])
		}
			
	}	

	#Print class stats
	if (error_state == 0)
	{
		{print "Total number of students in class: ", class_size}
		{print "Class average of quiz: ", class_quiz/class_size}
		{print "Class average of homework: ", class_hw/class_size}
		{print "Class average of exam: ", class_exam/class_size}
		{print "Class average of final exam: ", class_final/class_size}
		{print "Class average grade:", class_grade/class_size, "(" grade2letter(class_grade/class_size) ")"}
	}
	
	else if (error_state == 1)
	{
		{print "Class averages not calculated due to errors."}
	}
	

} #Close of END block

#Convert numberical score to a letter grade (bonus)
function grade2letter(score)
{
	if (score >= 97)  letter = "A+"
  	else if (score >= 94) letter = "A"
  	else if (score >= 90) letter = "A-"
  	else if (score >= 87) letter = "B+"
  	else if (score >= 84) letter = "B"
  	else if (score >= 80) letter = "B-"
  	else if (score >= 77) letter = "C+"
  	else if (score >= 74) letter = "C"
	else if (score >= 70) letter = "C-"
	else if (score >= 60) letter = "D"

	return letter;
}