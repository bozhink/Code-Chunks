namespace WebApplication1.Controllers
{
    using Models.Data;
    using System;
    using System.Linq.Expressions;
    using System.Web.Mvc;
    using ViewModels.Data;

    public class DataController : Controller
    {
        // GET: Data
        [HttpGet]
        public ActionResult Index()
        {
            return this.View();
        }

        [HttpGet]
        public ActionResult New()
        {
            return this.View(new DataModel
            {
                Start = DateTime.Now
            });
        }

        [HttpPost]
        public ActionResult Update(DataModel model)
        {
            if (ModelState.IsValid)
            {
                model.Id = Guid.NewGuid().ToString().GetHashCode();
                return this.View(model);
            }

            return this.Redirect(nameof(this.Index));
        }

        [HttpGet]
        public ActionResult ObjectAsViewModelTest()
        {
            return this.View(new DataViewModel
            {
                StartTime = DateTime.Now,
                Monday = true
            });
        }

        public static Expression<Func<TIn, TOut>> CreatePropertyAccessor<TIn, TOut>(string propertyName)
        {
            var param = Expression.Parameter(typeof(TIn));
            var body = Expression.PropertyOrField(param, propertyName);
            return Expression.Lambda<Func<TIn, TOut>>(body, param);
        }
    }
}
