#CS390 HW5 - grade.awk
#awk script that calculates student average grade and letter grade
# Phil Jarrett, Spring 2016

BEGIN{



}


#Calculate grades passed from grade report script (jarrett.sh)
# Grades passed in as Quiz HW Midterm Final

grade = ($1 * 0.1) + ($2 * 0.4) + ($3 * 0.2) + ($4 * 0.3)


END{

print grade "\t" grade2letter(grade)

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
	else if (score >= 0)  letter = "F"

	return letter;
}
