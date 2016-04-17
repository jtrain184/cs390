#ifndef EMPLOYEE_H
#define EMPLOYEE_H

#include <string>
#include <fstream>
#include <sstream>
#include <iostream>

using std::cout;
using std::string;
using std::endl;
using std::cin;

class Employee
{
private:         
	string firstName;
	string lastName;
	int salary;

public:
	Employee() {};
	friend std::istream& operator >> (std::istream& is, Employee& employee)
	{
		std::string line;
		std::getline(is, line);

		std::istringstream iss(line);

		iss >> employee.firstName;
		iss >> employee.lastName;
		iss >> employee.salary;

		return is;

	}

	void employeeSearch(Employee employees[], int size);

};
#endif
