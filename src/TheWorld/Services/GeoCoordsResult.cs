using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TheWorld.Services
{
    //https://www.bingmapsportal.com/Application# for API Key
    public class GeoCoordsResult
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public double Longitude { get; set; }
        public double Latitude { get; set; }
    }
}
