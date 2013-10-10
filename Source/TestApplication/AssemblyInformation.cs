using System.Reflection;

namespace TestApplication
{
    public static class AssemblyInformation
    {
        public static string GetAssemblyVersion()
        {
            return Assembly.GetExecutingAssembly().GetName().Version.ToString();            
        }
    }
}
