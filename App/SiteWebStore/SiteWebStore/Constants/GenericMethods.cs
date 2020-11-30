using System.Web;
using Newtonsoft.Json;


namespace SiteWebStore.Constants
{
    public class GenericMethods
    {
        public void CreateCookie(string serializeObject,string nameCookie)
        {
            HttpCookie cookie = new HttpCookie(nameCookie);
            cookie.Value = serializeObject;
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public HttpCookie GetCookie(string nameCookie)
        {
          return HttpContext.Current.Request.Cookies[nameCookie];
        }
    }
}