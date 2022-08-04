using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CustomersService.Models;

namespace CustomersService.Controllers
{
    [Route("api/[Controller]")]
    [ApiController]
    public class CustomerController : Controller
    {
        public static List<Customer> customerList = new List<Customer>()
       { new Customer(){CustomerID=1,CustomerName="Krishav",CustomerContact=826509},
           new Customer(){CustomerID=1,CustomerName="Keshav",CustomerContact=826809},
           new Customer(){CustomerID=1,CustomerName="Aditi",CustomerContact=820809}
       };

        [HttpGet]
        public List<Customer> Get()
        {
            return customerList;
        }

        [HttpGet("(id")]
        public Customer Get(int id)
        {
            Customer obje = customerList.Find(item => item.CustomerID == id);
                return obje;
        }

        [HttpPost]
        public IActionResult Put([FromBody] Customer newobj)
        {
            foreach(Customer c in customerList)
            {
                if (newobj.CustomerID == c.CustomerID)
                {
                    c.CustomerID = newobj.CustomerID;
                    c.CustomerName = newobj.CustomerName;
                    c.CustomerContact = newobj.CustomerContact;
                }
            }

            return Ok();
        }

        [HttpDelete("{id}")]

        public IActionResult Delete(int id)
        {
            Customer conobj = customerList.Find(item => item.CustomerID == id);

            if (customerList != null)
            {
                bool isRemoved = customerList.Remove(conobj);
                if (isRemoved)
                    return Ok(conobj);
            }

            return NotFound();
        }



       

        
     
    }
}
