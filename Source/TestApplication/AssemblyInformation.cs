using System;
using System.Reflection;

namespace TestApplication
{
    public static class AssemblyInformation
    {
        public static string GetAssemblyCompany()
        {
            return ((AssemblyCompanyAttribute)Attribute.GetCustomAttribute(Assembly.GetExecutingAssembly(), 
                typeof(AssemblyCompanyAttribute), false)).Company;
        }

        public static string GetAssemblyVersion()
        {
            return Assembly.GetExecutingAssembly().GetName().Version.ToString();            
        }
    }
}
