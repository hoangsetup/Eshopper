using System.Linq;
using System.Web.Mvc;

namespace Eshopper.Controllers
{
    public class HomeController : ApplicationController
    {

        public ActionResult Index()
        {
            ViewData["title"] = "Home | E-Shopper";
            ViewData["featuresItems"] =
                DataContext.tblProducts.OrderByDescending(product => product.PK_iProductID).Take(6).ToList();
            ViewData["categoryTag"] =
                DataContext.tblCategories.Where(category => category.tblCategory1.Count == 0 && category.bParent).Take(6)
                    .ToList();
            return View();
        }

        public ActionResult Category(int id)
        {
            ViewData["title"] = "Category | E-Shopper";
            ViewData["products"] = DataContext.tblProducts.Where(product => product.FK_iCategoryID == id).ToList();
            return View();
        }

    }
}
