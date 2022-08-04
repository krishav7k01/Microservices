using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CustomersService.Models
{
    public class Customer
    {
        public int CustomerID { get; set; }
        public String CustomerName { get; set; }

        public int CustomerContact { get; set; }
    }
}
