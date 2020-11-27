using SiteWebStore.Constants;
using SiteWebStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SiteWebStore.Controllers
{
    public class BrandsController : Controller
    {
        public ActionResult ListBrand()
        {
            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {
                var brands = new List<tbBrand>();

                try
                {
                    brands = db.tbBrands.Where(x => x.State == 1).ToList();
                }
                catch (Exception ex)
                {

                    ModelState.AddModelError("", RestrictionConstants.Error + ex.Message);
                }


                return PartialView(brands);
            }
        }
    }
}