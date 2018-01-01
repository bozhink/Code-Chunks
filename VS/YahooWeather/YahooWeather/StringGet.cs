namespace YahooWeather
{
    using System;
    using System.IO;
    using System.Net;

    public class StringGet
    {
        public static string GetPageAsString(Uri address)
        {
            string result = string.Empty;

            var request = WebRequest.Create(address) as HttpWebRequest;

            using (var response = request.GetResponse() as HttpWebResponse)
            {
                var reader = new StreamReader(response.GetResponseStream());
                result = reader.ReadToEnd();
            }

            return result;
        }
    }
}
