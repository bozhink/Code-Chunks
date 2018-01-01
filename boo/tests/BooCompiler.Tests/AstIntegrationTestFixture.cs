namespace BooCompiler.Tests
{
	using NUnit.Framework;

	[TestFixture]
	public class AstIntegrationTestFixture : AbstractCompilerTestCase
	{
	

		override protected string GetRelativeTestCasesPath()
		{
			return "integration/ast";
		}
	}
}
