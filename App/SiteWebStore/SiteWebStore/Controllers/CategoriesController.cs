using SiteWebStore.Constants;
using SiteWebStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SiteWebStore.Controllers
{
    public class CategoriesController : Controller
    {
        public ActionResult ListCategories()
        {
            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {
                var categories = new List<tbCategory>();
              
                try
                {
                    categories = db.tbCategories.Where(x => x.State == 1).ToList();
                }
                catch (Exception ex)
                {

                    ModelState.AddModelError("", RestrictionConstants.Error + ex.Message);
                }

                return PartialView(categories);
            }
        }
    }
}