using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.Xml;
using System.Xml.Xsl;
using System.IO;

namespace CachedXsl
{
    class Program
    {
        public static string[] xmlFiles = new string[] { @"..\..\Person_1.xml", @"..\..\Person_2.xml", @"..\..\Person_3.xml" };
        public static string xslFile = @"..\..\Person.xsl";

        bool isInitialized = false;

        XslCompiledTransform xct = null;
        XsltSettings xs = null;
        XmlUrlResolver xur = null;

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

        private void Initialize()
        {
            xct = new XslCompiledTransform();
            xs = new XsltSettings(true, true);
            xur = new XmlUrlResolver();
            try
            {
                xct.Load(Program.xslFile, xs, xur);
                isInitialized = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        private void Run(XmlDocument xmlDoc, string fileName)
        {
            if (!isInitialized)
            {
                Initialize();
            }
            try
            {
                StringBuilder sb = new StringBuilder();
                XmlWriter xw = XmlWriter.Create(sb);
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
