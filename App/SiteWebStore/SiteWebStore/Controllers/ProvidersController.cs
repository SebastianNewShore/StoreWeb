using SiteWebStore.Constants;
using SiteWebStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SiteWebStore.Controllers
{
    public class ProvidersController : Controller
    {
        public ActionResult ListProvider()
        {
            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {
                var providers = new List<tbProvider>();

                try
                {
                    providers = db.tbProviders.Where(x => x.State == 1).ToList();
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", RestrictionConstants.Error + ex.Message);
                }

                return PartialView(providers);
            }
        }

        public static string ProviderName(int idProvider)
        {
            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {
                return db.tbProviders.Find(idProvider).Name;
            }
        }
    }
}