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
            System.Console.WriteLine("Version: {0}", AssemblyInformation.GetAssemblyVersion());
            System.Console.ReadLine();
        }
    }
}
