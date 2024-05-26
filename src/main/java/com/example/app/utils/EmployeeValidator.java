package com.example.app.utils;

import com.example.app.entity.Employee;
import com.example.app.exceptions.EmployeeDataException;

public class EmployeeValidator {

    public Employee validate(Employee employee) throws EmployeeDataException {
        StringBuilder builder = new StringBuilder();
        if (employee.getName() == null ||
                employee.getName().trim().isEmpty()){
            builder.append("Name cannot be empty; ");
        }
        if (employee.getPosition() == null ||
                employee.getPosition().trim().isEmpty()){
            builder.append("Position cannot be empty; ");
        }
        if (employee.getPhone() == null ||
                AppValidator.isPhoneValid(employee.getPhone().trim())){
            builder.append("Phone: phone must be in format xxx xxx-xxxx.");
        }
        if (builder.toString().isEmpty()){
            return employee;
        }
        throw new EmployeeDataException(builder.toString());
    }

}
