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
        private static List<tbProduct> productMemory = new List<tbProduct>();
        private static List<tbSubCategoryProduct> listCategories = new List<tbSubCategoryProduct>();

        public ActionResult ListProducts()
        {
            using (dbStoreWebEntities db = new dbStoreWebEntities())
            {
                var products = new List<tbProduct>();
                try
                {
                    products = (from p in db.tbProducts 
                                where p.State == 1
                                select p).ToList();

                    foreach(var product in productMemory)
                    {
                       if(product.State.Equals(1) && products.Any(x => x.Code == product.Code))
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

            try
            {
                using (dbStoreWebEntities db = new dbStoreWebEntities())
                {
                    if (db.tbProducts.Any(x => x.Code != p.Code) && productMemory.Any(x => x.Code == p.Code)) {
                        var product = new tbProduct();

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

                        productMemory.Add(product);

                        foreach (var category in p.Categories.Split(','))
                        {
                            listCategories.Add(new tbSubCategoryProduct {
                                tbProduct = product,
                                IdSubCategory = int.Parse(category)
                            });
                        }

                        if (this.Request.Form[RestrictionConstants.SaveMode] == RestrictionConstants.DataBase)
                            SaveDatabase(product, listCategories);
                        //else if(this.Request.Form[RestrictionConstants.SaveMode] == RestrictionConstants.Memory)
                        //    SaveMemory(product, listCategories);

                        return RedirectToAction("ListProducts");
                    }
                    else
                    {
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

        //private void SaveMemory(tbProduct product, List<tbSubCategoryProduct> listCategories)
        //{
        //    productMemory.Add(new ProductModel {
        //    Code = product.Code,
        //    Name = product.Name,
        //    State = product.State,
        //    Stock = product.Stock,
        //    Discount = product.Discount,
        //    InternalPrice = product.InternalPrice,
        //    PublicPrice = product.PublicPrice,
        //    IdBrand = product.IdBrand,
        //    IdProvider = product.IdProvider
        //});

        //}
    }
}