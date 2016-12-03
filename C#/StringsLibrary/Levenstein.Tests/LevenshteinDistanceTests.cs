using System;
using Levensteint;
using NUnit.Framework;

// https://www.dotnetperls.com/levenshtein
namespace Levenstein.Tests
{
    [TestFixture]
    public class LevenshteinDistanceTests
    {
        [TestCase("ant", "aunt", 1)]
        [TestCase("Sam", "Samantha", 5)]
        [TestCase("clozapine", "olanzapine", 3)]
        [TestCase("flomax", "volmax", 3)]
        [TestCase("toradol", "tramadol", 3)]
        [TestCase("kitten", "sitting", 3)]
        public void LevenshteinDistance_CalculateWithNonEmptyStrings_ShouldWork(string s, string t, int dist)
        {
            Assert.AreEqual(dist, LevenshteinDistance.Compute(s, t));
        }
    }
}


