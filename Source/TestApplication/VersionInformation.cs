using System.Reflection;

namespace TestApplication
{
    public static class VersionInformation
    {
        public static string GetAssemblyVersion()
        {
            return Assembly.GetExecutingAssembly().GetName().Version.ToString();            
        }
    }
}
