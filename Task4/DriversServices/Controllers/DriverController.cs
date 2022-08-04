using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DriversService.Models;

namespace DriversService.Controllers
{
    public class DriverCOntroller : Controller
    {
        public static List<Driver> DriverList = new List<Driver>()
       { new Driver(){DriverID=1,DriverName="Sam",DriverContact=826509},
           new Driver(){DriverID=1,DriverName="Tim",DriverContact=826809},
           new Driver(){DriverID=1,DriverName="Cook",DriverContact=820809}
       };

        [HttpGet]
        public List<Driver> Get()
        {
            return DriverList;
        }

        [HttpGet("(id")]
        public Driver Get(int id)
        {
            Driver obje = DriverList.Find(item => item.DriverID == id);
            return obje;
        }

        [HttpPost]
        public IActionResult Put([FromBody] Driver newobj)
        {
            foreach (Driver c in DriverList)
            {
                if (newobj.DriverID == c.DriverID)
                {
                    c.DriverID = newobj.DriverID;
                    c.DriverName = newobj.DriverName;
                    c.DriverContact = newobj.DriverContact;
                }
            }

            return Ok();
        }

        [HttpDelete("{id}")]

        public IActionResult Delete(int id)
        { 
    
            Driver conobj = DriverList.Find(item => item.DriverID == id);

            if (DriverList != null)
            {
                bool isRemoved = DriverList.Remove(conobj);
                if (isRemoved)
                    return Ok(conobj);
            }

            return NotFound();
        }
    }
}
