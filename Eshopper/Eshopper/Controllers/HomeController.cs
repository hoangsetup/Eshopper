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

        public ActionResult Category(int id)
        {
            ViewData["title"] = "Category | E-Shopper";
            ViewData["products"] = DataContext.tblProducts.Where(product => product.FK_iCategoryID == id).ToList();
            return View();
        }

        public ActionResult ProductDetails(int id)
        {
            tblProduct product =
                DataContext.tblProducts.FirstOrDefault(tblProduct => tblProduct.PK_iProductID == id);
            ViewData["product"] = product;
            ViewData["reviews"] = DataContext.tblReviews.Where(review => review.FK_iProductID == id).ToList();
            return View();
        }

        public ActionResult AddReview(FormCollection collection)
        {
            tblReview review = new tblReview
            {
                FK_iProductID = Convert.ToInt32(collection["id"]),
                sEmail = collection["email"],
                sName = collection["name"],
                sReview = collection["content"],
                tDatetime = DateTime.Now
            };
            DataContext.tblReviews.Add(review);
            DataContext.SaveChanges();
            return RedirectToAction("ProductDetails/" + collection["id"]);
        }
    }
}
