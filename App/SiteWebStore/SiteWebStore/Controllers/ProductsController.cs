using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SiteWebStore.Models;
using Newtonsoft.Json;

namespace SiteWebStore.Controllers
{
    public class ProductsController : Controller
    {
        dbStoreWebEntities db = new dbStoreWebEntities();
        // GET: Products
        public ActionResult ListProducts()
        {
            var products = new List<ProductModel>();
            try
            {
                products = (from p in db.tbProducts
                            join b in db.tbBrands on p.IdBrand equals b.Id
                            join v in db.tbProviders on p.IdProvider equals v.Id
                            where p.State == 1
                            select new ProductModel
                            {
                                Id = p.Id,
                                Code = p.Code,
                                Name = p.Name,
                                Stock = p.Stock,
                                DiscountProduct = p.Discount + " %",
                                InternalPrice = p.InternalPrice,
                                PublicPrice = p.PublicPrice,
                                Brand = b.Name,
                                Provider = v.Name
                            }).ToList();
            }

            catch
            {

            }

            return View(products);
        }

        public ActionResult ProductDetails(int id)
        {
            var detail = new DetailModel();

            try {
                var information = (from p in db.tbProducts
                                   where p.Id == id
                                   select new 
                                    {
                                        Description = p.Description,
                                        ProductDetail = p.ProductDetail,
                                        Name = (from pc in db.tbSubCategoryProducts
                                               join sc in db.tbSubCategories on pc.IdSubCategory equals sc.Id
                                               where pc.IdProduct == p.Id
                                               select new
                                               {
                                                   sc.Name
                                               }).ToList()
                                   }).ToList();

                
              
                detail = JsonConvert.DeserializeObject<DetailModel>(information.Select(x => x.ProductDetail).ToList().FirstOrDefault());
                detail.Description = information.Select(x => x.Description).ToList().FirstOrDefault();
                detail.categories = string.Join(", ", from e in information from x in e.Name select x.Name);

            }
            catch(Exception e)
            {

            }
            return View(detail);
        }

  
    }
}