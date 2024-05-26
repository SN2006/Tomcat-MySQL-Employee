package com.example.app.controller;

import com.example.app.entity.Employee;
import com.example.app.exceptions.EmployeeDataException;
import com.example.app.repository.impl.EmployeeRepository;
import com.example.app.utils.EmployeeValidator;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;

import java.io.IOException;
import java.util.List;

public class EmployeeController extends HttpServlet {

    private final EmployeeRepository repository = new EmployeeRepository();
    private final EmployeeValidator validator = new EmployeeValidator();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new" -> showNewForm(request, response);
                case "/insert" -> create(request, response);
                case "/delete" -> delete(request, response);
                case "/edit" -> showEditForm(request, response);
                case "/update" -> update(request, response);
                default -> read(request, response);
            }
        }catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws HibernateException, IOException, EmployeeDataException {
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String phone = request.getParameter("phone");
        Employee employee = new Employee();
        employee.setName(name);
        employee.setPosition(position);
        employee.setPhone(phone);
        Employee validatedEmployee = validator.validate(employee);
        repository.create(validatedEmployee);
        response.sendRedirect("list");
    }

    private void read(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Employee> employeeList = repository.read();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("pages/employee_list.jsp");
        dispatcher.forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws HibernateException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String phone = request.getParameter("phone");
        Employee employee = new Employee(
                id, name, position, phone
        );

        Employee validatedEmployee = validator.validate(employee);
        repository.update(validatedEmployee);

        response.sendRedirect("list");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws HibernateException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        repository.delete(id);
        response.sendRedirect("list");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("pages/employee_form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws HibernateException, ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Employee existingBook = repository.readById(id);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("pages/employee_form.jsp");
        request.setAttribute("employee", existingBook);
        dispatcher.forward(request, response);
    }

}
