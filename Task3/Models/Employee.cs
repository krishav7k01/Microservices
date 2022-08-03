using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TaskDay3.Models
{
    public class Employee
    {

        [Key]
        public int EmpNo { get; set; }
        public string Name { get; set; }

        public string Gender { get; set; }


        public int Salary { get; set; }

        public string Address { get; set; }
    }
}
