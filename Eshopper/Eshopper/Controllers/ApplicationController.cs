﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using Eshopper.Models;

namespace Eshopper.Controllers
{
    public class ApplicationController : Controller
    {
        private readonly db_EshopperEntities _dataContext = new db_EshopperEntities();

        public db_EshopperEntities DataContext
        {
            get { return _dataContext; }
        }
        public ApplicationController()
        {
            ViewData["categories"] = (from category in DataContext.tblCategories select category).ToList();
            ViewData["brands"] = (from brand in DataContext.tblBrands select brand).ToList();
        }
    }
}
