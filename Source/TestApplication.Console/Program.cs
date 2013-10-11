using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TestApplication.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Console.WriteLine("Test Application");
            System.Console.WriteLine("Company: {0}", AssemblyInformation.GetAssemblyCompany());
            System.Console.WriteLine("Version: {0}", AssemblyInformation.GetAssemblyVersion());
            System.Console.WriteLine("Here is an additional line");
            System.Console.ReadLine();
        }
    }
}
