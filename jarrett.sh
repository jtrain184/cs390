#! /bin/bash
#CS390 HW5 - jarrett.sh
#A bash shell script that creates a report (using awk) of class grade
# Phil Jarrett, Spring 2016


#checkLimits() - makes sure grade range is correct
function checkLimits() {
	user_input=$1
	if echo $user_input | grep '[^0-9]' >/dev/null; then
    echo 'Invalid input'
	fi
	if [[ $1 -gt 100 || $1 -lt 0 ]]
	then echo "Please enter a valid number 0-100" 
	continue
	fi
}

#studentGrade() - handles entering of student grades, with user menu
function studentGrade() {
	gradeQ=0
	gradeH=0
	gradeM=0
	gradeF=0
echo "Select grade to enter (1-5): "
options="Quiz Homework Test Final Quit"
select type in $options; do
case $type in
	Quiz) echo -n "Please enter quiz grade: "
		read gradeQ
		checkLimits $gradeQ
		;;
	Homework) echo -n "Please enter HW grade: "
		read gradeH
		checkLimits $gradeH
		;;
	Test) echo -n "Please enter test grade: "
		read gradeM
		checkLimits $gradeM
		;;
	Final) echo -n "Please enter final grade: "
		read gradeF
		checkLimits $gradeF
		;;
	"Quit")
		 
		line="$gradeQ $gradeH $gradeM $gradeF"
		grade=`echo $line |awk -f grade.awk`
		score=`echo $grade |awk '{print $5}'`
		letter=`echo $grade |awk '{print $6}'`
		echo -e "Score for " $1	"is: " $score  $letter

		#Add grade to report
		format="%-8s %8d %8d %8d %8d %8d %8s\n"
		printf "$format" $1 $gradeQ $gradeH $gradeM $gradeF $score $letter  >> test.out
		break
		;;
	*) echo "Wrong grade type!"
		;;
esac
done
}

#createReport() - generates output file for grade data
function createReport(){
header="\n %-8s %8s %8s %8s %8s %8s %8s\n"
printf "$header" "Name" "Quiz" "Homework" "Midterm" "FinalExam" "Score" "Grade" >> $1



#DEBUG- Report
#printf "$format" "James" 90 100 74 75 84 B >> $1		
}

#Check for correct arguments
if [ $# -lt 2 ] ; then
	echo "You need two arguments: 1) The awk script and 2) Output file for grade report"
	exit 1
fi

#Initialize file variables
awk_file=$1
report_file=$2


#Check to see if awk script exists in current directory
if [ ! -f $awk_file ]; then
	echo awk script $1 does not exist in current directory.
	exit 1
fi

#Check to see if report file already exists, disply if it does
# or create if it does not exist
if [ -f $report_file ]; then
	echo "Current report output: "
	cat $report_file
else 
	createReport $report_file
fi

#User input loop
answer="yes"
while [ "$answer" == "yes" ]
do
	echo -n "Build grade record for student (yes or no):"
	read answer

	if [ "$answer" == "yes" ] ; then
		echo "Please enter student name: "	
		read name

		echo "you entered: " $name
		studentGrade $name

	else
		echo You have finished entering student records... Printing report...
		cat $report_file
	fi
done
