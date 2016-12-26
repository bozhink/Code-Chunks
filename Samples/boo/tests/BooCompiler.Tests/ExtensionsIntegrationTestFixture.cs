namespace BooCompiler.Tests
{
	using NUnit.Framework;

	[TestFixture]
	public class ExtensionsIntegrationTestFixture : AbstractCompilerTestCase
	{
	
		[Test]
		public void extension_properties_1()
		{
			RunCompilerTestCase(@"extension-properties-1.boo");
		}
		
		[Test]
		public void extensions_1()
		{
			RunCompilerTestCase(@"extensions-1.boo");
		}
		
		[Test]
		public void extensions_2()
		{
			RunCompilerTestCase(@"extensions-2.boo");
		}
		
		[Test]
		public void extensions_3()
		{
			RunCompilerTestCase(@"extensions-3.boo");
		}
		
		[Test]
		public void extensions_4()
		{
			RunCompilerTestCase(@"extensions-4.boo");
		}
		
		[Test]
		public void extensions_5()
		{
			RunCompilerTestCase(@"extensions-5.boo");
		}
		
		[Test]
		public void extensions_6()
		{
			RunCompilerTestCase(@"extensions-6.boo");
		}
		
		[Test]
		public void extensions_7()
		{
			RunCompilerTestCase(@"extensions-7.boo");
		}
		
		[Test]
		public void extensions_8()
		{
			RunCompilerTestCase(@"extensions-8.boo");
		}
		
		[Test]
		public void extensions_9()
		{
			RunCompilerTestCase(@"extensions-9.boo");
		}
		
		[Test]
		public void extensions_for_self_1()
		{
			RunCompilerTestCase(@"extensions-for-self-1.boo");
		}
		
		[Test]
		public void extensions_for_self_2()
		{
			RunCompilerTestCase(@"extensions-for-self-2.boo");
		}
		
		[Test]
		public void implicit_conversion_extension_1()
		{
			RunCompilerTestCase(@"implicit-conversion-extension-1.boo");
		}
		
		[Test]
		public void implicit_conversion_extension_2()
		{
			RunCompilerTestCase(@"implicit-conversion-extension-2.boo");
		}
		

		override protected string GetRelativeTestCasesPath()
		{
			return "integration/extensions";
		}
	}
}
