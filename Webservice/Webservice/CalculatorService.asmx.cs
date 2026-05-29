using System;
using System.Web.Services;

namespace Webservice
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(
        ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class WebService1 : WebService
    {
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public int Add(int a, int b)
        {
            return a + b;
        }
    }
}