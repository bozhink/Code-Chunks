using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace PenTagger
{
	class FileProcessor
	{
		protected const string Charset = "utf-8";
		protected string inputFileName;
		protected string outputFileName;
		protected string xml;

		public FileProcessor ()
		{
		}
		
		public FileProcessor (string inputFileName, string outputFileName)
		{
			ResetCalss (inputFileName, outputFileName);
		}

		protected void ResetCalss (string inputFileName, string outputFileName)
		{
			this.inputFileName = inputFileName;
			this.outputFileName = outputFileName;
		}
		
		/// <summary>
		/// This method reads the inputFileName
		/// </summary>
		/// <returns>returns the inputFileName content</returns>
		public void GetContent()
		{
			StreamReader reader = null;
			Encoding encoding = Encoding.GetEncoding(Charset);
			string line = string.Empty;
			StringBuilder result = new StringBuilder();
			
			if (!File.Exists(inputFileName))
			{
				Console.WriteLine("File " + inputFileName + "not found.");
				return;
			}
			try
			{
				reader = new StreamReader(inputFileName, encoding);
				while ((line = reader.ReadLine()) != null)
				{
					result.Append(line);
					result.Append('\n');
				}
			}
			catch (IOException ioex)
			{
				Console.WriteLine("Can not read file " + inputFileName + ".");
				Console.WriteLine(ioex.Message);
			}
			catch (ArgumentOutOfRangeException aorex)
			{
				Console.WriteLine("Argument out of range in the StringBuilder.");
				Console.WriteLine(aorex.Message);
			}
			finally
			{
				if (reader != null)
				{
					reader.Close();
				}
			}
			// Remove all Carret Return (CR) symbols
			xml = Regex.Replace(result.ToString(), "\r", "");
		}
		
		public string GetXML()
		{
			return xml;
		}
		
		public void WriteXMLFile()
		{
			Encoding encoding = Encoding.GetEncoding(Charset);
			StreamWriter writer = null;
			try
			{
				writer = new StreamWriter(this.outputFileName, false, encoding);
				writer.Write(xml);
			}
			catch (IOException ioex)
			{
				Console.WriteLine("Can not write to file " + outputFileName + ".");
				Console.WriteLine(ioex.Message);
			}
			finally
			{
				if (writer != null)
				{
					writer.Close();
				}
			}
		}
	}
}
