using TaskDay3.Models;
using TaskDay3.Repositries;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TaskDay3.Repositries
{

    public class EmployeeRepo : IEmployeeRepo
    {
        private readonly ApplicationDbContext _context;

        public EmployeeRepo(ApplicationDbContext context)
        {
            _context = context;
        }

        public void AddEmployee(Employee obj)
        {
            _context.Employees.Add(obj);
            _context.SaveChanges();
        }

        public void DeleteEmployee(int id)
        {
            Employee obj = _context.Employees.Find(id);
            _context.Employees.Remove(obj);
            _context.SaveChanges();
        }

        public List<Employee> GetAllEmployee()
        {
            List<Employee> stList = _context.Employees.ToList();
            return stList;
        }

        public Employee GetEmployeeById(int id)
        {
            Employee obj = _context.Employees.Find(id);
            return obj;
        }

        public void UpdateEmployee(Employee obj)
        {
            _context.Employees.Update(obj);
            _context.SaveChanges();
        }
    }
}

