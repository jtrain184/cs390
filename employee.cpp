#include "employee.h"



void Employee::employeeSearch(Employee employees[], int size)
{
	string lName, fName;
	
	bool match = false;

	
	cout << "Enter Employee last name: " << endl;
	std::cin >> lName;
	cout << "Enter Employee first name: " << endl;
	std::cin >> fName;

	for (int count = 0; count < 25; count++)
	{
		if (fName == employees[count].firstName && lName == employees[count].lastName)
		{
			cout << "Name: " << employees[count].firstName << " " << employees[count].lastName << endl
				<< "Salary: $" << employees[count].salary << endl;
			match = true;
		}
	}
	if (!match)
		cout << "Employee " << fName << " " << lName << " not found." << endl;
}