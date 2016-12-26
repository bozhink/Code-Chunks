
namespace BooCompiler.Tests
{
	using NUnit.Framework;

	[TestFixture]
	public class Net2ErrorsTestFixture : AbstractCompilerErrorsTestFixture
	{
		override protected void RunCompilerTestCase(string name)
		{
			if (System.Environment.Version.Major < 2) Assert.Ignore("Test requires .net 2.");
			base.RunCompilerTestCase(name);
		}

		[Test]
		public void BCE0138_1()
		{
			RunCompilerTestCase(@"BCE0138-1.boo");
		}
		
		[Test]
		public void BCE0138_2()
		{
			RunCompilerTestCase(@"BCE0138-2.boo");
		}
		
		[Test]
		public void BCE0139_1()
		{
			RunCompilerTestCase(@"BCE0139-1.boo");
		}
		
		[Test]
		public void BCE0139_2()
		{
			RunCompilerTestCase(@"BCE0139-2.boo");
		}
		
		[Test]
		public void BCE0139_3()
		{
			RunCompilerTestCase(@"BCE0139-3.boo");
		}
		
		[Test]
		public void BCE0147_external()
		{
			RunCompilerTestCase(@"BCE0147-external.boo");
		}
		
		[Test]
		public void BCE0149_external()
		{
			RunCompilerTestCase(@"BCE0149-external.boo");
		}
		

		override protected string GetRelativeTestCasesPath()
		{
			return "net2/errors";
		}
	}
}
