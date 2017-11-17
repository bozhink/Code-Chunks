using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.Composition;
using System.ComponentModel.Composition.Hosting;
using System.Threading;

namespace MEFSample
{
    public class Program
    {
        [Import]
        private string message = "1";

        [ImportMany]
        private IEnumerable<int> mylist;

        public static void Main(string[] args)
        {
            Program p = new Program();
            p.Run();
        }

        private void Run()
        {
            this.Compose();
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
            Thread.Sleep(10);
            Console.WriteLine(this.message);
        }

        private void Compose()
        {
            AssemblyCatalog catalog = new AssemblyCatalog(System.Reflection.Assembly.GetExecutingAssembly());
            CompositionContainer container = new CompositionContainer(catalog);
            container.SatisfyImportsOnce(this);
        }
    }
}
