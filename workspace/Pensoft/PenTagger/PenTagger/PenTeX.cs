using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace PenTagger
{
	class TeX : FileProcessor
	{
		public TeX (string inputFileName, string outputFileName)
		{
			ResetCalss (inputFileName, outputFileName);
		}
		
		public void XMLtoTeX ()
		{
			xml = Regex.Replace (xml, "_", "\\_");
			xml = Regex.Replace (xml, @"\s*</back>[^\r]*</article>", "");
			xml = Regex.Replace (xml, @"<italic>([^\r]*?)</italic>", "\\textit{$1}");
			xml = Regex.Replace (xml, @"<bold>([^\r]*?)</bold>", "\\textbf{$1}");
			xml = Regex.Replace (xml, @"<sup>(.*?)</sup>", "$^\\text{$1}$");
			xml = Regex.Replace (xml, @"<sub>(.*?)</sub>", "$_\\text{$1}$");
			xml = Regex.Replace (xml, @"<tp:taxon-name(\s[^>]*)?>(.*?)</tp:taxon-name>", "$2");
			xml = Regex.Replace (xml, "<!--PageBreak-->", "");
			xml = Regex.Replace (xml, @"<[^>]*>(urn\:lsid\:zoobank.*?)</[^>]*>", "\\href{http://zoobank.org/?lsid=$1}{$1}");
			xml = Regex.Replace (xml, @"<email[^>]*>(.*?)</email[^>]*>", "\\href{mailto:$1}{$1}");
			xml = Regex.Replace (xml, "<object-id xlink:type=\"simple\">(.*?)</object-id>", "\\href{$1}{$1}");

			xml = Regex.Replace (xml, @"\s*<abstract>\s*<label>.*?</label>\s*([^\r]*?)\s*</abstract>\s*", "\n\\begin{abstract}$1\n\\end{abstract}\n");

			// !!!!!
			xml = Regex.Replace (xml, "<xref ref-type=\"(fig|bibr)\"[^>]*>(.*?)</xref>", "$2");
			xml = Regex.Replace (xml, "<xref>(.*?)</xref>", "$1");

			// !!!!!
			xml = Regex.Replace (xml, "<table-wrap[^>]*>[^\r]*?</table-wrap[^>]*>", "");
			xml = Regex.Replace (xml, "<history>[^\r]*?</history>", "");
			xml = Regex.Replace (xml, "<permissions>[^\r]*?</permissions>", "");
			xml = Regex.Replace (xml, "<journal-meta>[^\r]*?</journal-meta>", "");
			xml = Regex.Replace (xml, @"<(article |\?xml|!DOCTYPE)[^>]*?>\s*", "");



			xml = Regex.Replace (xml, @"\n\s*<tp:treatment-sec[^>]*>\s*<title>(.*?)</title>([^\r]*?)</tp:treatment-sec>", "\n\n\\paragraph{$1}$2");
			for (Match taxon = Regex.Match (xml, "<tp:taxon-name>([^\r]*?)</tp:taxon-name>"); taxon.Success; taxon = taxon.NextMatch())
			{
				string replace = Regex.Replace(taxon.Value, "<tp:taxon-name-part taxon-name-part-type=\"genus\">(.*?)</tp:taxon-name-part>", "\\textit{$1}");
				replace = Regex.Replace(replace, "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">(.*?)</tp:taxon-name-part>", "\\textit{$1}");
				replace = Regex.Replace(replace, "<tp:taxon-name-part taxon-name-part-type=\"species\">(.*?)</tp:taxon-name-part>", "\\textit{$1}");
				replace = Regex.Replace(replace, "<tp:taxon-name-part taxon-name-part-type=\"subspecies\">(.*?)</tp:taxon-name-part>", "\\textit{$1}");
				replace = Regex.Replace(replace, "<tp:taxon-name-part[^>]*>(.*?)</tp:taxon-name-part>", "$1");
				replace = Regex.Replace(replace, @"\s+", " ");
				replace = Regex.Replace(replace, @"(<tp:taxon-name>)\s*", "$1");
				replace = Regex.Replace(replace, @"\s*(</tp:taxon-name>)", "$1");
				xml = Regex.Replace (xml, Regex.Escape (taxon.Value), replace);
			}
			xml = Regex.Replace (xml, @"(<tp:taxon-treatment>)(\s*)(<tp:nomenclature>)\s*(<tp:taxon-name>.*?</tp:taxon-name>)\s*(<tp:taxon-authority>.*?</tp:taxon-authority>)?\s*(<tp:taxon-status>.*?</tp:taxon-status>)?",
			                    "$1<title>$4, $5, $6</title>$2$3");
			xml = Regex.Replace (xml, "<tp:taxon-name>(.*?)</tp:taxon-name>", "$1");
			xml = Regex.Replace (xml, "<tp:taxon-authority>(.*?)</tp:taxon-authority>", "$1");
			xml = Regex.Replace (xml, "<tp:taxon-status>(.*?)</tp:taxon-status>", "$1");
			xml = Regex.Replace (xml, @",\s*,", ",");
			xml = Regex.Replace (xml, @",\s*</title>", "</title>");
			xml = Regex.Replace (xml, @"\n\s*<tp:taxon-treatment><title>(.*?)</title>([^\r]*?)</tp:taxon-treatment>", "\n\n\\subsection*{$1}$2");

			for (Match nomenclature = Regex.Match (xml, @"<tp:nomenclature>([^\r]*?)</tp:nomenclature>"); nomenclature.Success; nomenclature = nomenclature.NextMatch())
			{
				string replace = Regex.Replace (nomenclature.Value, @"\n\s*", "\n\n\\noindent ");
				replace = Regex.Replace (replace, @"\s*</?tp:nomenclature-citation-list>\s*", "\n\n");
				replace = Regex.Replace (replace, @"<tp:nomenclature-citation>(.*?)</tp:nomenclature-citation>", "$1");

				xml = Regex.Replace (xml, Regex.Escape (nomenclature.Value), replace);
			}
			xml = Regex.Replace (xml, @"\s*<tp:nomenclature>\s*", "\n\n");
			xml = Regex.Replace (xml, @"\s*(\\noindent)?\s*</tp:nomenclature>\s*", "\n\n");
			xml = Regex.Replace (xml, @"\s*\n\s*\\noindent\s*\n\s*", "\n\n");
			xml = Regex.Replace (xml, @"\\noindent\s+\\", "\\noindent\\");

			xml = Regex.Replace (xml, @"(\\paragraph\{.*?\})\s*<p>(.*?)</p>", "$1 $2");

			xml = Regex.Replace (xml, @"\s*<ack>\s*<title>.*?</title>([^\r]*?)\s*</ack>", "\n\\section*{Acknowledgements}$1");

			for (Match bib = Regex.Match(xml, @"\s*<ref-list>([^\r]*?)</ref-list>"); bib.Success; bib = bib.NextMatch())
			{
				string replace = Regex.Replace (bib.Value, @"\s*<ref-list>\s*<title>.*?</title>([^\r]*?)\s*</ref-list>", "\n\n\\section*{References}$1");
				replace = Regex.Replace (replace, @"\s*<ref[^>]*>", "\n\n\\noident ");
				replace = Regex.Replace (replace, @"</?[^>]*>", "");
				replace = Regex.Replace (replace, @"\n\n+", "\n\n");

				xml = Regex.Replace (xml, Regex.Escape(bib.Value), replace);
			}


			// !!!!
			xml = Regex.Replace (xml, @"\n\s*<sec[^>]*>\s*<title>(.*?)</title>([^\r]*?)</sec>", "\n\n\\section*{$1}$2");
			// !!!!!!
			xml = Regex.Replace (xml, @"(<sec.*|</sec>)", "");


			xml = Regex.Replace (xml, @"\s*<p>(.*?)</p>", "\n\n$1");
			xml = Regex.Replace (xml, @"\s*</body>\s*<back>\s*", "\n\n");

			xml = Regex.Replace (xml, @"\s*(</?front>|</?body>|</?back>)\s*", "\n\n");

			xml = Regex.Replace (xml, @"\n\s*\n", "\n\n");
			xml = Regex.Replace (xml, @"\n\n+", "\n\n");
			xml = Regex.Replace (xml, @"(\\begin\{.*?\})\s*([^\r]*?)\s*(\\end{.*?})", "$1\n$2\n$3");
		}
	}
}
