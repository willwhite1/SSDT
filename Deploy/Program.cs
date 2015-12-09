using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer.Dac;

namespace Deploy
{
    class Program
    {
        static void Main(string[] args)
        {
            DacServices dacServices = new DacServices("server=.");
            dacServices.ProgressChanged += DacServices_ProgressChanged;

            DacDeployOptions dacDeployOptions = new DacDeployOptions();
            dacDeployOptions.SqlCommandVariableValues.Add(new KeyValuePair<string, string>("DataFiles", AppDomain.CurrentDomain.BaseDirectory + @"..\..\..\Database\bin\debug"));
            
         
            DacPackage dacPackage = DacPackage.Load(AppDomain.CurrentDomain.BaseDirectory + @"..\..\..\Database\bin\debug\AdventureWorks.dacpac");

            dacServices.Deploy(dacPackage, "AdventureWorksTest", true, dacDeployOptions);

            Console.WriteLine("Press any key to exit");
            Console.ReadKey();
        }

        private static void DacServices_ProgressChanged(object sender, DacProgressEventArgs e)
        {
            Console.WriteLine(e.Message);
        }
    }
}
