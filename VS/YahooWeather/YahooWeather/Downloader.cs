namespace YahooWeather
{
    using System;
    using System.Data;
    using System.Net;
    using System.Xml;
    using System.Xml.XPath;

    public class Downloader
    {
        public void RunSample()
        {
            HttpWebRequest request = WebRequest.Create("http://xml.weather.yahoo.com/forecastrss?p=94704") as HttpWebRequest;

            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                DataSet dataSetWeather = new DataSet();
                dataSetWeather.ReadXml(response.GetResponseStream());

                PrintDataSet(dataSetWeather);
            }
        }

        public void UseXmlDocument()
        {
            XmlDocument document = new XmlDocument();
            document.Load("http://xml.weather.yahoo.com/forecastrss?p=94704");

            XmlNamespaceManager namespaceManager = new XmlNamespaceManager(document.NameTable);
            namespaceManager.AddNamespace("yweather", "http://xml.weather.yahoo.com/ns/rss/1.0");

            XmlNodeList nodes = document.SelectNodes("/rss/channel/item/yweather:forecast", namespaceManager);

            //// You can also get elements based on their tag name and namespace,
            //// though this isn't recommended
            ////XmlNodeList nodes = doc.GetElementsByTagName("forecast", "http://xml.weather.yahoo.com/ns/rss/1.0");

            foreach (XmlNode node in nodes)
            {
                Console.WriteLine(
                    "{0}: {1}, {2}F - {3}F",
                    node.Attributes["day"].InnerText,
                    node.Attributes["text"].InnerText,
                    node.Attributes["low"].InnerText,
                    node.Attributes["high"].InnerText);
            }
        }

        public void UseXmlReader()
        {
            var reader = new XmlTextReader("http://xml.weather.yahoo.com/forecastrss?p=94704")
            {
                WhitespaceHandling = WhitespaceHandling.Significant
            };

            while (reader.Read())
            {
                Console.WriteLine("{0}: {1}", reader.NodeType.ToString(), reader.Name);
            }
        }

        public void UseXPathNavigator()
        {
            XPathDocument document = new XPathDocument("http://xml.weather.yahoo.com/forecastrss?p=94704");
            XPathNavigator navigator = document.CreateNavigator();

            XmlNamespaceManager namespaceManager = new XmlNamespaceManager(navigator.NameTable);
            namespaceManager.AddNamespace("yweather", "http://xml.weather.yahoo.com/ns/rss/1.0");

            // Get forecast with XPath
            XPathNodeIterator nodes = navigator.Select("/rss/channel/item/yweather:forecast", namespaceManager);
            while (nodes.MoveNext())
            {
                XPathNavigator node = nodes.Current;

                Console.WriteLine(
                    "{0}: {1}, {2}F - {3}F",
                    node.GetAttribute("day", namespaceManager.DefaultNamespace),
                    node.GetAttribute("text", namespaceManager.DefaultNamespace),
                    node.GetAttribute("low", namespaceManager.DefaultNamespace),
                    node.GetAttribute("high", namespaceManager.DefaultNamespace));
            }
        }

        private static void PrintDataSet(DataSet dataSet)
        {
            // Print out all tables and their columns
            foreach (DataTable table in dataSet.Tables)
            {
                Console.WriteLine("TABLE '{0}'", table.TableName);
                Console.WriteLine("Total # of rows: {0}", table.Rows.Count);
                Console.WriteLine("---------------------------------------------------------------");

                foreach (DataColumn column in table.Columns)
                {
                    Console.WriteLine("- {0} ({1})", column.ColumnName, column.DataType.ToString());
                }

                Console.WriteLine(Environment.NewLine);
            }

            // Print out table relations
            foreach (DataRelation relation in dataSet.Relations)
            {
                Console.WriteLine("RELATION: {0}", relation.RelationName);
                Console.WriteLine("---------------------------------------------------------------");
                Console.WriteLine("Parent: {0}", relation.ParentTable.TableName);
                Console.WriteLine("Child: {0}", relation.ChildTable.TableName);
                Console.WriteLine(Environment.NewLine);
            }
        }
    }
}
