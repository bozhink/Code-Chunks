using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml;

namespace PenTagger
{
	class HTML : FileProcessor
	{
		public HTML (string inputFileName, string outputFileName)
		{
			ResetCalss (inputFileName, outputFileName);
		}

		/// <summary>
		/// Renumeration this instance.
		/// Initial format of the html file
		/// </summary>
		public void Format()
		{
			xml = Regex.Replace(xml, "(class=\")\\s*(.*)\\s*(\")", "$1$2$3");
			xml = Regex.Replace(xml, "<div class=\"uris\">\\s*</div>", "");
			xml = Regex.Replace(xml, "event\\)\">(.*)\n</a> <a target=\"_blank\" class=\"taxonNameLink\"", "event)\"><i>$1</i></a> <a target=\"_blank\" class=\"taxonNameLink\"");
			xml = Regex.Replace(xml, " event\\)\">(([A-Z][a-z]+)|([a-z]+))</a></span></span>\n", " event)\"><i>$1</i></a></span></span>\n");
			xml = Regex.Replace(xml, @"\s*(</(p|th|td)>)", "$1");
			xml = Regex.Replace(xml, @"(<(p|th|td)[^>]*>)\s*", "$1");
			xml = Regex.Replace(xml, @"\s+(</span>)", " $1");
			xml = Regex.Replace(xml, @"(<span[^>]*>)\s+", "$1 ");
			xml = Regex.Replace(xml, @"(\s*?\n)+", "\n");
			xml = Regex.Replace(xml, Regex.Escape("    "), "\t");
			xml = Regex.Replace(xml, "&lt;br\\s*/&gt;", "<br />");
			xml = Regex.Replace(xml, "(</span>–)\\s*(<span)", "$1$2");
			xml = Regex.Replace(xml, "(<div class=\"section\">)\n(<a\\s)", "$1$2");
			xml = Regex.Replace(xml, "(<div class=\"reference[^>]*>.*?)\\s*?(<div class=\"unfloat\"></div>)\\s*?(</div>)", "$1$2$3");
			xml = Regex.Replace(xml, "><table", ">\n<table");
			xml = Regex.Replace(xml, "(<script[^>]*>)\\s*(initBalloons\\(\\);)\\s*(</script>)", "$1$2$3");
			xml = Regex.Replace(xml, "(</script>)(<)", "$1\n$2");
			xml = Regex.Replace(xml, "\n\\s*?(</script>)", "\n$1");
			xml = Regex.Replace(xml, "(>)(<head)", "$1\n$2");
			xml = Regex.Replace(xml, "</body></html>", "</body>\n</html>");

			Match s1 = Regex.Match(xml, "<script language=\"javascript\">\\s*if[^\r]*?</script>");
			if (s1.Success) {
				string replace = Regex.Replace (s1.Value, @"\s*(if|\})", "\n\t$1");
				replace = Regex.Replace (replace, @"\s*(document)", "\n\t\t$1");
				xml = Regex.Replace (xml, Regex.Escape(s1.Value), replace);
			}
			for (s1 = Regex.Match(xml, "<script type=\"text/javascript\">[^\r]*</script>"); s1.Success; s1 = s1.NextMatch()) {
				string replace = Regex.Replace (s1.Value, @"\n\t(\t+)", "\n$1");
				xml = Regex.Replace (xml, Regex.Escape(s1.Value), replace);
			}
			
			// Format the main title on one row
			Match title = Regex.Match(xml, "<div class=\"mainTitle\">[^\r]*?</div>");
			if (title.Success) {
				string replace = Regex.Replace(title.Value, @"\n\s*", " ");
				replace = Regex.Replace(replace, @"\(\s*(.*)\s*\)", "($1)");
				replace = Regex.Replace(replace, @"(<div[^>]*>)\s*", "$1");
				replace = Regex.Replace(replace, @"\s*(</div>)", "$1");
				xml = Regex.Replace(xml, Regex.Escape(title.Value), replace);
			}
		}

		public void ParseSection ()
		{
			Match body = Regex.Match(xml, "<div class=\"secHolder\">[^\r]*</div>\\s*(?=<a name=\"acknowledgements\"></a>)");
			if (!body.Success) {
				body = Regex.Match(xml, "<div class=\"secHolder\">[^\r]*</div>\\s*(?=<a name=\"references\"></a>)");
				if (!body.Success) return;
			}
			string xml1 = body.Value;
			// Do some substitutions
			xml1 = Regex.Replace (xml1, "<", "{LANGLE}");
			xml1 = Regex.Replace (xml1, ">", "{RANGLE}");
			xml1 = Regex.Replace (xml1, @"\{LANGLE\}(/?div.*?)\{RANGLE\}", "<$1>");
			xml1 = Regex.Replace (xml1, @"\{LANGLE\}(/?span.*?)\{RANGLE\}", "<$1>");
			xml1 = Regex.Replace (xml1, "\\&", "{AMPERSAND}");
			
			XmlDocument doc = new XmlDocument();
			doc.LoadXml(xml1);
			XmlNode root = doc.FirstChild;
			if (root.HasChildNodes)
			{
				for (int i = 0; i < root.ChildNodes.Count; i++) {
					XmlNode child = root.ChildNodes[i];
					string replace = Regex.Replace (child.InnerXml, "(<div class=\"section\">[^\r]*?<span class=\")node_title(\")", "$1node_title1$2");
					Console.WriteLine("\n\n\n\n\n\n{0}\n\n\n\n\n\n", replace);
					xml1 = Regex.Replace(xml1, Regex.Escape(child.InnerXml), replace);
				}
			}
			
			xml = xml1;
		}

		public string GetSection (int initialIndex)
		{
			//int idx1=0, idx2=0, idx=0, h=0;
			int isec=0, iDiv=0, idiv=0, idx=0;
			string result = "";
			bool firstPass = true;
			for (Match sec = Regex.Match(xml.Substring(initialIndex), "<div class=\"section\">"); sec.Success; sec = sec.NextMatch()) {
				isec = sec.Index;
				if (isec < idiv) { // Here we found a subsection
					continue;
				}
				if (firstPass) {
					idx = isec;
					firstPass = false;
				}
				Match Div = Regex.Match(xml.Substring(initialIndex), "<div[^>]*>");
				iDiv = Div.Index;
				Match div = Regex.Match(xml.Substring(initialIndex), "</div>");
				if (!div.Success) {
					Console.WriteLine("ERROR: There is <div> tag but there is no matching </div>!");
					result = "";
					return result;
				}
				idiv = div.Index;
				// Position all indices correctly
				while (iDiv < isec) {
					Div = Div.NextMatch ();
					if (Div.Success) {
						iDiv = Div.Index;
					} else {
						break;
					}
				}
				if (iDiv < isec) {
					Console.WriteLine("Can not match <div> as <div class=\"section\">?");
					result = "";
					return result;
				}
				while (idiv < isec) {
					div = div.NextMatch();
					if (div.Success) {
						idiv = div.Index;
					} else {
						break;
					}
				}
				if (idiv < isec) {
					Console.WriteLine("Can not match </div> after <div class=\"section\">");
					result = "";
					return result;
				}
				// Here we know where are the first <div class="section"> tag, and the  first <div> and </div> tag after it
				Console.WriteLine("isec = {0}, iDiv = {1}, idiv = {2}", isec, iDiv, idiv);
				// Look for <div> between found <div class="section"> and </div>
				// Level of <div> tag
				int internalDivs = 0;
				while (iDiv < idiv) {
					Div = Div.NextMatch();
					if (Div.Success) {
						iDiv = Div.Index;
						internalDivs++;
					} else {
						break;
					}
				}
				if (internalDivs>0) --internalDivs;
				for (int i=0; i<internalDivs; i++) {
					div = div.NextMatch();
					if (div.Success) {
						idiv = div.Index;
					} else {
						Console.WriteLine("ERROR: There is no enough </div> tags!");
						result = "";
						return result;
					}
				}
				result = xml.Substring(isec, idiv - isec + 6);
				Match span = Regex.Match (result, "<span class=\"node_title\">.*?</span>");
				span = span.NextMatch();
				string replace = result;
				while (span.Success) {
					string replace1 = Regex.Replace(span.Value, "<span class=\"node_title\">", "<span class=\"node_title1\">");
					replace = Regex.Replace(replace, Regex.Escape(span.Value), replace);
				}
				string stdout = Regex.Replace(result, @"\s*<p[^>]*>.*?</p>", "");
				stdout = Regex.Replace(stdout, @"\s*<a[^>]*>.*?</a>", "");
				stdout = Regex.Replace(stdout, @"\s*<span[^>]*>.*?</span>", "");
				stdout = Regex.Replace(stdout, @"\s*</?(span|i)>", "");
				Console.WriteLine("\n\n{0}\n\n", stdout);
				
				xml = Regex.Replace(xml, Regex.Escape(result), replace);
			}
			return result;
		}
	}
}