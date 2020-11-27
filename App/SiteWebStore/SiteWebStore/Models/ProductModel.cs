using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SiteWebStore.Models
{
    public class ProductModel : tbProduct
    {
        public string Brand { get; set; }
        public string Provider { get; set; }

        [Display(Name = "Discount")]
        public string DiscountProduct { get; set; }

    }
}