using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SiteWebStore.Models;
using Newtonsoft.Json;
using SiteWebStore.Constants;

namespace SiteWebStore.Controllers
{
    public class ProductsController : Controller
    {
        GenericMethods GenericMethods = new GenericMethods();
        public ActionResult ListProducts()
        {
            var products = new List<tbProduct>();

            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {        
                try
                {
                    products = (from p in db.tbProducts 
                                where p.State == 1
                                select p).ToList();

                    foreach (var product in ProductsMemory())
                    {
                        if (product.State.Equals(1))
                            products.Add(product);
                    }
                   
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(RestrictionConstants.Error, ex);
                }

                return View(products);
            }
        }

        public ActionResult ProductDetails(int id)
        {
            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {
                BrandsController prueba = new BrandsController();

                var detail = new DetailModel();

                try
                {
                    var information = (from p in db.tbProducts
                                       where p.Id == id
                                       select new
                                       {
                                           Description = p.Description,
                                           ProductDetail = p.ProductDetail,
                                           Name = (from pc in db.tbSubCategoryProducts
                                                   join sc in db.tbCategories on pc.IdSubCategory equals sc.Id
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
                catch (Exception ex)
                {
                    ModelState.AddModelError("", RestrictionConstants.Error + ex.Message);
                }

                return View(detail);
            }
        }

        public ActionResult CreateProduct()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateProduct(ProductModel p)
        {
            if (!ModelState.IsValid)
                return View();
   
            var products = new List<tbProduct>();

            try
            {
                using (dbStoreWebEntities db = new dbStoreWebEntities())
                {
                    if (!db.tbProducts.Any(x => x.Code == p.Code) && !ProductsMemory().Any(x => x.Code == p.Code) && !string.IsNullOrEmpty(p.Categories)) {
                        var product = new tbProduct();
                        var Categories = new List<tbSubCategoryProduct>();

                        product.Code = p.Code;
                        product.Name = p.Name;
                        product.State = p.State;
                        product.Stock = p.Stock;
                        product.Discount = p.Discount;
                        product.InternalPrice = p.InternalPrice;
                        product.PublicPrice = p.PublicPrice;
                        product.IdBrand = p.IdBrand;
                        product.IdProvider = p.IdProvider;
                        product.Description = p.Description;
                        product.ProductDetail = RestrictionConstants.JsonMockup;

                        foreach (var category in p.Categories.Split(','))
                        {
                            Categories.Add(new tbSubCategoryProduct {
                                tbProduct = product,
                                IdSubCategory = int.Parse(category)
                            });
                        }

                        if (this.Request.Form[RestrictionConstants.SaveMode] == RestrictionConstants.DataBase)
                            SaveDatabase(product, Categories);
                        else
                        {
                            var productsMemory = ProductsMemory();
                            productsMemory.Add(product);
                            GenericMethods.CreateCookie(JsonConvert.SerializeObject(productsMemory), RestrictionConstants.ProductCookie);
                        }

                            return RedirectToAction("ListProducts");                        
                    }
                    else
                    {
                        if(string.IsNullOrEmpty(p.Categories))
                        ModelState.AddModelError("", RestrictionConstants.SelectedCategory);
                        else
                        ModelState.AddModelError("", RestrictionConstants.ProductExist);
                    }
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", RestrictionConstants.Error + ex.Message);
            }
            return View();
        }

        private void SaveDatabase(tbProduct product, List<tbSubCategoryProduct> listCategories)
        {
            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {
                try
                {
                    db.tbProducts.Add(product);
                    foreach(var category in listCategories){
                        db.tbSubCategoryProducts.Add(category);
                    }  
                            
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", RestrictionConstants.Error + ex.Message);
                }
            }
        }

        public List<tbProduct> ProductsMemory()
        {
            if (GenericMethods.GetCookie(RestrictionConstants.ProductCookie) != null)
            {
                return JsonConvert.DeserializeObject<List<tbProduct>>(GenericMethods.GetCookie(RestrictionConstants.ProductCookie).Value);
            } 
            return new List<tbProduct>();
        }

        public static string UnitRevenue(decimal publicPrice, decimal internalPrice, int discount)
        {
            return string.Format("{0:C0}",(((publicPrice * discount) / 100)  + publicPrice) - internalPrice); 
        }

        public static string TotalRevenue(decimal publicPrice, decimal internalPrice, int discount, int stock)
        {
            return string.Format("{0:C0}", ((((publicPrice * discount) / 100) + publicPrice) - internalPrice) * stock);
        }
    }
}