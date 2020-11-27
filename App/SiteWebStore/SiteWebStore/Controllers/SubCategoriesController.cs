using SiteWebStore.Constants;
using SiteWebStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SiteWebStore.Controllers
{
    public class SubCategoriesController : Controller
    {
        public ActionResult ListSubCategories(int idCategory)
        {
            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {
                var subCategories = new List<tbSubCategory>();

                try
                {
                    subCategories = db.tbSubCategories.Where(x => x.State == 1 && x.IdCategory == idCategory).ToList();
                }
                catch (Exception ex)
                {

                    ModelState.AddModelError("", RestrictionConstants.Error + ex.Message);
                }

                return PartialView(subCategories);
            }
        }
    }
}