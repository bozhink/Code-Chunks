using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Xsl;
using System.IO;
using System.Diagnostics;
using System.Xml;

namespace OriginalSlow
{
    class Program
    {
        public static string[] xmlFiles = new string[] { @"..\..\Person_1.xml", @"..\..\Person_2.xml", @"..\..\Person_3.xml" };
        public static string xslFile = @"..\..\Person.xsl";

        static void Main(string[] args)
        {
            Program p = new Program();
            Stopwatch sw = new Stopwatch();
            foreach (string xmlfile in Program.xmlFiles)
            {
                sw.Start();
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(xmlfile);
                p.Run(xmlDoc, xmlfile);
                sw.Stop();
                Console.WriteLine("{0} done, elapsed time (ms): {1}", xmlfile, sw.ElapsedMilliseconds);
                sw.Reset();
            }
        }

        private void Run(XmlDocument xmlDoc, string fileName)
        {
            XslCompiledTransform xct = new XslCompiledTransform();
            StringBuilder sb = new StringBuilder();
            XmlWriter xw = XmlWriter.Create(sb);
            XsltSettings xs = new XsltSettings(true, true);
            XmlUrlResolver xur = new XmlUrlResolver();

            try
            {
                xct.Load(Program.xslFile, xs, xur);
                xct.Transform(xmlDoc, xw);
                using (StreamWriter sw = new StreamWriter(fileName + ".html"))
                {
                    sw.Write(sb.ToString());
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }

}
