using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using day2day.Models;

namespace day2day.Controllers
{
    [RoutePrefix("api/Country")]
    public class CountryController : ApiController
    {
        static List<Country> countryList = new List<Country>()
        {
            new Country{Id=1, Countryname="Australia", Capital="Canberra"},
             new Country{Id=2, Countryname="India", Capital="Delhi"},
              new Country{Id=1, Countryname="Russia", Capital="Moscow"},

        };

        [HttpGet]
        [Route("Comlist")]

        public IHttpActionResult AllCountries()
        {
            if (countryList is null)
                return NotFound();

            return Ok(countryList);

        }

        [HttpGet]
        [Route("{id")]

        public IHttpActionResult GetCountryById(int id)
        {
            Country Conobj = countryList.Find(item => item.Id == id);

            if (countryList is null)
                return NotFound();

            return Ok(Conobj);

        }

        [HttpPost]
        public IHttpActionResult AddCountry([FromBody] Country Conobj)
        {
            if (Conobj != null)
            {
                countryList.Add(Conobj);
                return Ok(Conobj);

            }

            return NotFound();
        }

        [HttpPut]
        [Route("{id}")]

        public IHttpActionResult UpdateCountry([FromBody] Country obj)
        {
            foreach(Country c in countryList)
            {
                if(obj.Id == c.Id)
                {
                    c.Countryname = obj.Countryname;
                    c.Capital = obj.Capital;
                }
            }

            return Ok(obj);
        }

        [HttpDelete]
        [Route("{id")]

        public IHttpActionResult DeleteById(int id)
        {
            Country conobj = countryList.Find(item => item.Id == id);

            if(countryList !=null)
            {
                bool isRemoved = countryList.Remove(conobj);
                if (isRemoved)
                    return Ok(conobj);
            }

            return NotFound();
        }




    }
}
