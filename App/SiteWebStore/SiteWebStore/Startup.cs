using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SiteWebStore.Startup))]
namespace SiteWebStore
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
