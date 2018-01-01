using DataAccess;
using libsvm;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SvmTextClassification
{
    public class Program
    {
        public static void Main(string[] args)
        {
            const string SunnyData = "sunny-data.csv";
            var dataTable = DataTable.New.ReadCsv(SunnyData);
            List<string> x = dataTable.Rows.Select(row => row["Text"]).ToList();
            double[] y = dataTable.Rows.Select(row => double.Parse(row["IsSunny"])).ToArray();

            /* We have loaded all the sentences in the x variable, and all the class (-1 or +1) in the y variable. */

            var vocabulary = x.SelectMany(r => r.Split(' ')).Distinct().OrderBy(word => word).ToList();

            const int C = 1;
            var model = new C_SVC("sunnyData.problem", KernelHelper.LinearKernel(), C);

            string userInput;
            var _predictionDictionary = new Dictionary<int, string> { { -1, "Rainy" }, { 1, "Sunny" } };
            do
            {
                userInput = Console.ReadLine();
                var newX = TextClassificationProblemBuilder.CreateNode(userInput, vocabulary);

                var predictedY = model.Predict(newX);
                Console.WriteLine("The prediction is {0}", _predictionDictionary[(int)predictedY]);
                Console.WriteLine(new string('=', 50));
            } while (userInput != "quit");
        }
    }
}
 