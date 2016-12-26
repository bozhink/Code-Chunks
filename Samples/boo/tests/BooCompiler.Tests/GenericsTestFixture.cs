
namespace BooCompiler.Tests
{
	using NUnit.Framework;

	[TestFixture]
	public class GenericsTestFixture : AbstractCompilerTestCase
	{
		override protected void RunCompilerTestCase(string name)
		{
			if (System.Environment.Version.Major < 2) Assert.Ignore("Test requires .net 2.");
			System.ResolveEventHandler resolver = InstallAssemblyResolver(BaseTestCasesPath);
			try
			{
				base.RunCompilerTestCase(name);
			}
			finally
			{
				RemoveAssemblyResolver(resolver);
			}
		}

		override protected void CopyDependencies()
		{
			CopyAssembliesFromTestCasePath();
		}

		[Test]
		public void ambiguous_1()
		{
			RunCompilerTestCase(@"ambiguous-1.boo");
		}
		
		[Test]
		public void array_enumerable_1()
		{
			RunCompilerTestCase(@"array-enumerable-1.boo");
		}
		
		[Test]
		public void array_enumerable_2()
		{
			RunCompilerTestCase(@"array-enumerable-2.boo");
		}
		
		[Test]
		public void callable_1()
		{
			RunCompilerTestCase(@"callable-1.boo");
		}
		
		[Test]
		public void callable_2()
		{
			RunCompilerTestCase(@"callable-2.boo");
		}
		
		[Test]
		public void collections_1()
		{
			RunCompilerTestCase(@"collections-1.boo");
		}
		
		[Test]
		public void collections_2()
		{
			RunCompilerTestCase(@"collections-2.boo");
		}
		
		[Test]
		public void enumerable_type_inference_1()
		{
			RunCompilerTestCase(@"enumerable-type-inference-1.boo");
		}
		
		[Test]
		public void enumerable_type_inference_2()
		{
			RunCompilerTestCase(@"enumerable-type-inference-2.boo");
		}
		
		[Test]
		public void enumerable_type_inference_4()
		{
			RunCompilerTestCase(@"enumerable-type-inference-4.boo");
		}
		
		[Test]
		public void enumerable_type_inference_5()
		{
			RunCompilerTestCase(@"enumerable-type-inference-5.boo");
		}
		
		[Test]
		public void generators_1()
		{
			RunCompilerTestCase(@"generators-1.boo");
		}
		
		[Test]
		public void generators_2()
		{
			RunCompilerTestCase(@"generators-2.boo");
		}
		
		[Test]
		public void generators_3()
		{
			RunCompilerTestCase(@"generators-3.boo");
		}
		
		[Test]
		public void generators_4()
		{
			RunCompilerTestCase(@"generators-4.boo");
		}
		
		[Test]
		public void generators_5()
		{
			RunCompilerTestCase(@"generators-5.boo");
		}
		
		[Test]
		public void generators_6()
		{
			RunCompilerTestCase(@"generators-6.boo");
		}
		
		[Test]
		public void generators_7()
		{
			RunCompilerTestCase(@"generators-7.boo");
		}
		
		[Test]
		public void generic_array_1()
		{
			RunCompilerTestCase(@"generic-array-1.boo");
		}
		
		[Test]
		public void generic_array_2()
		{
			RunCompilerTestCase(@"generic-array-2.boo");
		}
		
		[Test]
		public void generic_array_3()
		{
			RunCompilerTestCase(@"generic-array-3.boo");
		}
		
		[Test]
		public void generic_method_1()
		{
			RunCompilerTestCase(@"generic-method-1.boo");
		}
		
		[Test]
		public void generic_method_2()
		{
			RunCompilerTestCase(@"generic-method-2.boo");
		}
		
		[Test]
		public void generic_method_3()
		{
			RunCompilerTestCase(@"generic-method-3.boo");
		}
		
		[Test]
		public void generic_method_4()
		{
			RunCompilerTestCase(@"generic-method-4.boo");
		}
		
		[Test]
		public void generic_method_5()
		{
			RunCompilerTestCase(@"generic-method-5.boo");
		}
		
		[Test]
		public void generic_method_invocation_1()
		{
			RunCompilerTestCase(@"generic-method-invocation-1.boo");
		}
		
		[Test]
		public void generic_method_invocation_2()
		{
			RunCompilerTestCase(@"generic-method-invocation-2.boo");
		}
		
		[Test]
		public void generic_ref_parameter()
		{
			RunCompilerTestCase(@"generic-ref-parameter.boo");
		}
		
		[Test]
		public void generic_type_resolution_1()
		{
			RunCompilerTestCase(@"generic-type-resolution-1.boo");
		}
		
		[Test]
		public void generic_type_resolution_2()
		{
			RunCompilerTestCase(@"generic-type-resolution-2.boo");
		}
		
		[Test]
		public void interface_1()
		{
			RunCompilerTestCase(@"interface-1.boo");
		}
		
		[Test]
		public void internal_generic_callable_type_1()
		{
			RunCompilerTestCase(@"internal-generic-callable-type-1.boo");
		}
		
		[Test]
		public void internal_generic_callable_type_2()
		{
			RunCompilerTestCase(@"internal-generic-callable-type-2.boo");
		}
		
		[Test]
		public void internal_generic_callable_type_3()
		{
			RunCompilerTestCase(@"internal-generic-callable-type-3.boo");
		}
		
		[Test]
		public void internal_generic_type_1()
		{
			RunCompilerTestCase(@"internal-generic-type-1.boo");
		}
		
		[Test]
		public void internal_generic_type_10()
		{
			RunCompilerTestCase(@"internal-generic-type-10.boo");
		}
		
		[Test]
		public void internal_generic_type_11()
		{
			RunCompilerTestCase(@"internal-generic-type-11.boo");
		}
		
		[Test]
		public void internal_generic_type_2()
		{
			RunCompilerTestCase(@"internal-generic-type-2.boo");
		}
		
		[Test]
		public void internal_generic_type_3()
		{
			RunCompilerTestCase(@"internal-generic-type-3.boo");
		}
		
		[Test]
		public void internal_generic_type_4()
		{
			RunCompilerTestCase(@"internal-generic-type-4.boo");
		}
		
		[Test]
		public void internal_generic_type_5()
		{
			RunCompilerTestCase(@"internal-generic-type-5.boo");
		}
		
		[Test]
		public void internal_generic_type_6()
		{
			RunCompilerTestCase(@"internal-generic-type-6.boo");
		}
		
		[Test]
		public void internal_generic_type_7()
		{
			RunCompilerTestCase(@"internal-generic-type-7.boo");
		}
		
		[Test]
		public void internal_generic_type_8()
		{
			RunCompilerTestCase(@"internal-generic-type-8.boo");
		}
		
		[Test]
		public void internal_generic_type_9()
		{
			RunCompilerTestCase(@"internal-generic-type-9.boo");
		}
		
		[Test]
		public void mixed_1()
		{
			RunCompilerTestCase(@"mixed-1.boo");
		}
		
		[Test]
		public void mixed_2()
		{
			RunCompilerTestCase(@"mixed-2.boo");
		}
		
		[Test]
		public void mixed_3()
		{
			RunCompilerTestCase(@"mixed-3.boo");
		}
		
		[Test]
		public void mixed_4()
		{
			RunCompilerTestCase(@"mixed-4.boo");
		}
		
		[Test]
		public void mixed_ref_parameter_1()
		{
			RunCompilerTestCase(@"mixed-ref-parameter-1.boo");
		}
		
		[Test]
		public void mixed_ref_parameter_2()
		{
			RunCompilerTestCase(@"mixed-ref-parameter-2.boo");
		}
		
		[Test]
		public void name_resolution_1()
		{
			RunCompilerTestCase(@"name-resolution-1.boo");
		}
		
		[Test]
		public void override_1()
		{
			RunCompilerTestCase(@"override-1.boo");
		}
		
		[Test]
		public void type_reference_1()
		{
			RunCompilerTestCase(@"type-reference-1.boo");
		}
		
		[Test]
		public void type_reference_2()
		{
			RunCompilerTestCase(@"type-reference-2.boo");
		}
		
		[Test]
		public void type_reference_3()
		{
			RunCompilerTestCase(@"type-reference-3.boo");
		}
		

		override protected string GetRelativeTestCasesPath()
		{
			return "net2/generics";
		}
	}
}
