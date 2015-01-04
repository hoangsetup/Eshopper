using System;
using System.Linq;
using System.Web.Mvc;
using Eshopper.Models;

namespace Eshopper.Controllers
{
    public class HomeController : ApplicationController
    {

        public ActionResult Index()
        {
            ViewData["title"] = "Home | E-Shopper";
            ViewData["featuresItems"] =
                DataContext.tblProducts.OrderByDescending(product => product.PK_iProductID).Take(6).ToList();
            return View();
        }

        public ActionResult Category(int? id)
        {


            ViewData["products"] = DataContext.tblProducts.Where(product => product.FK_iCategoryID == id).ToList();
            tblCategory category = DataContext.tblCategories.FirstOrDefault(x => x.PK_iCategoryID == id);
            if (category != null)
            {
                ViewData["title"] = (category.sCategoryName + " | E-Shopper");
                return View();
            }
            else
            {
                return View("_Error404");
            }
        }

        public ActionResult ProductDetails(int id)
        {
            tblProduct product =
                DataContext.tblProducts.FirstOrDefault(tblProduct => tblProduct.PK_iProductID == id);
            ViewData["product"] = product;
            ViewData["reviews"] = DataContext.tblReviews.Where(review => review.FK_iProductID == id).ToList();
            return View();
        }

        public PartialViewResult AddReview(FormCollection collection)
        {
            /*            tblReview review = new tblReview
                        {
                            FK_iProductID = Convert.ToInt32(collection["id"]),
                            sEmail = collection["email"],
                            sName = collection["name"],
                            sReview = collection["content"],
                            tDatetime = DateTime.Now
                        };*/
            tblReview review = new tblReview
            {
                FK_iProductID = 3,
                sEmail = "email",
                sName = "name",
                sReview = "content",
                tDatetime = DateTime.Now
            };
            DataContext.tblReviews.Add(review);
            DataContext.SaveChanges();
            return PartialView("_AddReview", review);
        }
    }
}
