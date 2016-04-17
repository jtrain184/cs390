#include <iostream>
#include <fstream>
#include "employee.h"

using std::cout;
using std::endl;
using std::string;



int main(int argc, char* argv[]) {

	Employee employee_db;
	Employee employees[100];
	int count = 0;
	char again;

	if (argc != 2) {
		cout << "Usage:  you need to supply file name as agrument for this program."
			<< endl << "Example: ./qsalary db.txt";
			return -1;
	}

	//Handling file
	std::ifstream dataFile;
	dataFile.open(argv[1]);


	if (!dataFile)
		cout << "Error opening file. Check for existence\n";

	else
	{
		while (dataFile >> employees[count])
			count++;

		//Close file
		dataFile.close();

		cout << "Employee salary search: " << endl;
		//Call search function, handle input loop
		do {
			employee_db.employeeSearch(employees, 25);

			cout << "Enter q to quit or anything else to search again" << endl;
			cin >> again;
		} while (toupper(again) != 'Q');

	}

	
	
	
	return 0;
}