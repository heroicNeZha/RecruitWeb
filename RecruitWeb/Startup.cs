using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RecruitWeb.Startup))]
namespace RecruitWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
