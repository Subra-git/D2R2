using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Profiles.SsoHarness.Models;

namespace Profiles.SsoHarness.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost] 
        public ActionResult Login(LoginModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            FormsAuthentication.SetAuthCookie(model.SsoUserTokenId, false);

            var test = HttpContext.Response;

            return RedirectToAction("Result");
        }

        [HttpGet]
        public ActionResult Result()
        {
            ViewBag.UserIsAuthenticated = HttpContext.User.Identity.IsAuthenticated;

            return View();
        }
    }
}