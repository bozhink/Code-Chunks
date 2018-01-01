namespace BooCompiler.Tests
{
	using NUnit.Framework;

	[TestFixture]
	public class MetaProgrammingIntegrationTestFixture : AbstractCompilerTestCase
	{
	
		[Test]
		public void auto_lift_1()
		{
			RunCompilerTestCase(@"auto-lift-1.boo");
		}
		
		[Test]
		public void auto_lift_2()
		{
			RunCompilerTestCase(@"auto-lift-2.boo");
		}
		
		[Test]
		public void compile_1()
		{
			RunCompilerTestCase(@"compile-1.boo");
		}
		
		[Test]
		public void compile_2()
		{
			RunCompilerTestCase(@"compile-2.boo");
		}
		
		[Test]
		public void field_splicing_1()
		{
			RunCompilerTestCase(@"field-splicing-1.boo");
		}
		
		[Test]
		public void generic_splicing_1()
		{
			RunCompilerTestCase(@"generic-splicing-1.boo");
		}
		
		[Test]
		public void interpolation_splicing_1()
		{
			RunCompilerTestCase(@"interpolation-splicing-1.boo");
		}
		
		[Test]
		public void interpolation_splicing_2()
		{
			RunCompilerTestCase(@"interpolation-splicing-2.boo");
		}
		
		[Test]
		public void meta_methods_1()
		{
			RunCompilerTestCase(@"meta-methods-1.boo");
		}
		
		[Test]
		public void meta_methods_2()
		{
			RunCompilerTestCase(@"meta-methods-2.boo");
		}
		
		[Test]
		public void meta_methods_3()
		{
			RunCompilerTestCase(@"meta-methods-3.boo");
		}
		
		[Test]
		public void meta_methods_4()
		{
			RunCompilerTestCase(@"meta-methods-4.boo");
		}
		
		[Test]
		public void meta_methods_5()
		{
			RunCompilerTestCase(@"meta-methods-5.boo");
		}
		
		[Test]
		public void meta_methods_6()
		{
			RunCompilerTestCase(@"meta-methods-6.boo");
		}
		
		[Test]
		public void name_splicing_1()
		{
			RunCompilerTestCase(@"name-splicing-1.boo");
		}
		
		[Test]
		public void name_splicing_2()
		{
			RunCompilerTestCase(@"name-splicing-2.boo");
		}
		
		[Test]
		public void name_splicing_3()
		{
			RunCompilerTestCase(@"name-splicing-3.boo");
		}
		
		[Test]
		public void name_splicing_4()
		{
			RunCompilerTestCase(@"name-splicing-4.boo");
		}
		
		[Test]
		public void name_splicing_5()
		{
			RunCompilerTestCase(@"name-splicing-5.boo");
		}
		
		[Test]
		public void parameter_splicing_1()
		{
			RunCompilerTestCase(@"parameter-splicing-1.boo");
		}
		
		[Test]
		public void parameter_splicing_2()
		{
			RunCompilerTestCase(@"parameter-splicing-2.boo");
		}
		
		[Test]
		public void parameter_splicing_3()
		{
			RunCompilerTestCase(@"parameter-splicing-3.boo");
		}
		
		[Test]
		public void property_splicing_1()
		{
			RunCompilerTestCase(@"property-splicing-1.boo");
		}
		
		[Test]
		public void quasi_quotation_1()
		{
			RunCompilerTestCase(@"quasi-quotation-1.boo");
		}
		
		[Test]
		public void quasi_quotation_2()
		{
			RunCompilerTestCase(@"quasi-quotation-2.boo");
		}
		
		[Test]
		public void quasi_quotation_3()
		{
			RunCompilerTestCase(@"quasi-quotation-3.boo");
		}
		
		[Test]
		public void splicing_1()
		{
			RunCompilerTestCase(@"splicing-1.boo");
		}
		
		[Test]
		public void splicing_2()
		{
			RunCompilerTestCase(@"splicing-2.boo");
		}
		
		[Test]
		public void splicing_3()
		{
			RunCompilerTestCase(@"splicing-3.boo");
		}
		
		[Test]
		public void splicing_4()
		{
			RunCompilerTestCase(@"splicing-4.boo");
		}
		
		[Test]
		public void splicing_5()
		{
			RunCompilerTestCase(@"splicing-5.boo");
		}
		
		[Test]
		public void splicing_6()
		{
			RunCompilerTestCase(@"splicing-6.boo");
		}
		
		[Test]
		public void splicing_7()
		{
			RunCompilerTestCase(@"splicing-7.boo");
		}
		
		[Test]
		public void splicing_8()
		{
			RunCompilerTestCase(@"splicing-8.boo");
		}
		
		[Test]
		public void splicing_9()
		{
			RunCompilerTestCase(@"splicing-9.boo");
		}
		
		[Test]
		public void typeref_splicing_1()
		{
			RunCompilerTestCase(@"typeref-splicing-1.boo");
		}
		
		[Test]
		public void typeref_splicing_2()
		{
			RunCompilerTestCase(@"typeref-splicing-2.boo");
		}
		
		[Test]
		public void typeref_splicing_3()
		{
			RunCompilerTestCase(@"typeref-splicing-3.boo");
		}
		

		override protected string GetRelativeTestCasesPath()
		{
			return "integration/meta-programming";
		}
	}
}
