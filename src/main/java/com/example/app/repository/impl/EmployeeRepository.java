package com.example.app.repository.impl;

import com.example.app.entity.Employee;
import com.example.app.repository.AppRepository;
import com.example.app.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.MutationQuery;

import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;

public class EmployeeRepository implements AppRepository<Employee> {

    private static final Logger LOGGER = Logger.getLogger(EmployeeRepository.class.getName());

    @Override
    public void create(Employee obj) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();

            String hql = "INSERT INTO Employee (name, position, phone) VALUES (:name, :position, :phone)";
            MutationQuery query = session.createMutationQuery(hql);
            query.setParameter("name", obj.getName());
            query.setParameter("position", obj.getPosition());
            query.setParameter("phone", obj.getPhone());
            query.executeUpdate();

            transaction.commit();
        }catch (Exception e){
            if (transaction != null) {
                transaction.rollback();
            }
            LOGGER.warning(e.getMessage());
        }
    }

    @Override
    public List<Employee> read() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            Transaction transaction = session.beginTransaction();
            String hql = "FROM Employee";
            List<Employee> employees = session.createQuery(hql, Employee.class).list();

            transaction.commit();
            return employees;
        }catch (Exception e){
            LOGGER.warning(e.getMessage());
            return Collections.emptyList();
        }
    }

    @Override
    public Employee readById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            Transaction transaction = session.beginTransaction();

            String hql = "FROM Employee WHERE id = :id";
            Employee employee = session.createQuery(hql, Employee.class).setParameter("id", id).uniqueResult();

            transaction.commit();
            return employee;
        }catch (Exception e){
            LOGGER.warning(e.getMessage());
            return null;
        }
    }

    @Override
    public void update(Employee obj) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();

            String hql =
                    "UPDATE Employee SET name = :name, position = :position, phone = :phone WHERE id = :id";

            MutationQuery query = session.createMutationQuery(hql);
            query.setParameter("name", obj.getName());
            query.setParameter("position", obj.getPosition());
            query.setParameter("phone", obj.getPhone());
            query.setParameter("id", obj.getId());

            query.executeUpdate();
            transaction.commit();
        }catch (Exception e){
            if (transaction != null) {
                transaction.rollback();
            }
            LOGGER.warning(e.getMessage());
        }
    }

    @Override
    public void delete(Long id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            String hql = "DELETE FROM Employee WHERE id = :id";

            MutationQuery query = session.createMutationQuery(hql);
            query.setParameter("id", id);
            query.executeUpdate();

            transaction.commit();
        }catch (Exception e){
            if (transaction != null) {
                transaction.rollback();
            }
            LOGGER.warning(e.getMessage());
        }
    }
}
