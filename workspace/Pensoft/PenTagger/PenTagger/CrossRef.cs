using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace PenTagger
{
	class CrossRef : FileProcessor
	{
		public CrossRef (string inputFileName, string outputFileName)
		{
			ResetCalss (inputFileName, outputFileName);
		}

		/// <summary>
		/// Renumeration this instance.
		/// re-numeration of citations in CrossRef XML files
		/// </summary>
		public void Renumeration()
		{
			int i=0;
			//Match m = Regex.Match(xml, "<citation key=\"ref\\d+\">(.*?)</citation>");
			Match m = Regex.Match(xml, "<ref.*?</ref>");
			while (m.Success)
			{
				//string replace = Regex.Replace(m.Value, "<citation key=\"ref\\d+\">", "<citation key=\"ref" + (++i) +"\">");
				string replace = Regex.Replace(m.Value, "<ref id=\"B\\d+\">", "<ref id=\"B" + (++i) +"\">");
				xml = Regex.Replace(xml, Regex.Escape(m.Value), replace);
				m = m.NextMatch();
			}
		}
	}
}