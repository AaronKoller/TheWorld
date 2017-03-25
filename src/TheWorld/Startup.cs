﻿using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using TheWorld.Services;

namespace TheWorld
{
    public class Startup
    {
        private IHostingEnvironment _env;

        public Startup(IHostingEnvironment env)
        {
            _env = env;
        }
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            if (_env.IsEnvironment("Development")  || _env.IsEnvironment("Testing"))
                services.AddScoped<IMailService, DebugMailService>();
            else
            {

            }

            services.AddMvc();
            //services.AddCaching();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsEnvironment("Development"))
                app.UseDeveloperExceptionPage();
            app.UseStaticFiles();

            app.UseMvc(config =>
            {
                config.MapRoute(
                    "Default",
                    "{controller}/{action}/{id?}",
                    new {controller = "App", action = "Index"});
            });
        }
    }
}