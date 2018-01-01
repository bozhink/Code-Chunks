using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using GameFifteen;

namespace MatrixTests
{
    [TestClass]
    public class MatrixWalkerTests
    {
        [TestMethod]
        public void MatrixWalker_CreateNewInstanceWithValidSize_ShouldSucceed()
        {
            int n = 3;
            MatrixWalker matrixWalker = new MatrixWalker(n);
            Assert.AreEqual(n, matrixWalker.Matrix.GetLength(0), "Invalid number of rows.");
            Assert.AreEqual(n, matrixWalker.Matrix.GetLength(1), "Invalid number of columns.");
        }
    }
}
