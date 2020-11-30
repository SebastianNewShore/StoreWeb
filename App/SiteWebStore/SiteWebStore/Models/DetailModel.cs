using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SiteWebStore.Models
{
    public class DetailModel
    {
        public string Description { get; set; }
        public string SKU { get; set; }
        public string Model { get; set; }
        public string Origin { get; set; }
        public int weight { get; set; }
        public string categories { get; set; }
    }
}