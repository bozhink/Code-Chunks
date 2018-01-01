namespace AccordNetSamples
{
    using System;

    using Accord.Controls;
    using Accord.MachineLearning.VectorMachines;
    using Accord.MachineLearning.VectorMachines.Learning;
    using Accord.Math;
    using Accord.Statistics.Kernels;

    public class Program
    {
        [MTAThread]
        public static void Main(string[] args)
        {
            double[][] inputs =
            {
                /* 1. */ new double[] { 0, 0 },
                /* 2. */ new double[] { 1, 0 },
                /* 3. */ new double[] { 0, 1 },
                /* 4. */ new double[] { 1, 1 }
            };

            int[] outputs =
            {
                /* 1. 0 xor 0 = 0 */ -1,
                /* 2. 1 xor 0 = 1 */ +1,
                /* 3. 0 xor 1 = 1 */ +1,
                /* 4. 1 xor 1 = 0 */ -1
            };

            // Create a new machine with a polynomial kernel and two inputs
            var ksvm = new KernelSupportVectorMachine(new Gaussian(), 2);

            // Create the learning algorithm with the given inputs and outputs
            var smo = new SequentialMinimalOptimization(machine: ksvm, inputs: inputs, outputs: outputs)
            {
                // Create a hard-margin SVM
                Complexity = 100
            };

            // Teach the machine
            double error = smo.Run();

            Console.WriteLine("Error: {0}", error);

            ScatterplotBox.Show(
                "SVM results",
                inputs,
                inputs.Apply(p => System.Math.Sign(ksvm.Compute(p))));

            Console.ReadKey();
        }
    }
}