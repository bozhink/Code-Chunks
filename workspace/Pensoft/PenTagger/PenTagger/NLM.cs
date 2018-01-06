using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml;

namespace PenTagger
{
	class NLM : FileProcessor
	{
		public NLM (string inputFileName, string outputFileName)
		{
			ResetCalss (inputFileName, outputFileName);
		}

		/// <summary>
		/// Renumeration this instance.
		/// re-numeration of citations in CrossRef XML files
		/// </summary>
		public void Format()
		{
			// DOCTYPE
			xml = Regex.Replace(xml, @"(<\?.*?\?>)([^\s])", "$1\n$2");
			xml = Regex.Replace(xml, @"<\!DOCTYPE [^>]*?>", "<!DOCTYPE article PUBLIC \"-//TaxonX//DTD Taxonomic Treatment Publishing DTD v0 20100105//EN\" \"tax-treatment-NS0.dtd\">");
			xml = Regex.Replace(xml, @"<article dtd-version[^>]*>", "<article article-type=\"research-article\" xmlns:mml=\"http://www.w3.org/1998/Math/MathML\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:tp=\"http://www.plazi.org/taxpub\">");
			
			// Format nomenclature
			for (Match nom = Regex.Match(xml, "<tp:nomenclature>[^\r]*?</tp:nomenclature>"); nom.Success; nom = nom.NextMatch()) {
				string replace = nom.Value;
				replace = Regex.Replace(replace, @"(<tp:taxon-name-part [^>]*>)\s*\((.*?)\)\s*(</tp:taxon-name-part>)", "($1$2$3)");
				
				for (Match nc = Regex.Match(replace, @"(<tp:nomenclature-citation>)(.*?)(</tp:nomenclature-citation>)"); nc.Success; nc = nc.NextMatch())
				{
					string replace1 = nc.Value;
					Match tn = Regex.Match(nc.Value, @"<tp:taxon-name>");
					if (tn.Success) {
						string pattern = @"(<tp:nomenclature-citation>)(.*?)?(<italic>)?(<tp:taxon-name>[A-Z].*?</tp:taxon-name>)(</italic>)?(.+)(</tp:nomenclature-citation>)";
						replace1 = Regex.Replace(nc.Value, pattern, "$1$4<comment>$6 $2</comment>$7");
					} else { // This is a nomenclature-citation tag without taxon-name
						Match taxonName = Regex.Match(nom.Value, @"<tp:taxon-name>[^\r]*?</tp:taxon-name>");
						string taxon = Regex.Replace(taxonName.Value, @"(<tp:taxon-name-part[^>]*>|</tp:taxon-name-part>)", "");
						taxon = Regex.Replace(taxon, @"\s+", " ");
						taxon = Regex.Replace(taxon, @"(<tp:taxon-name>)\s+", "$1");
						taxon = Regex.Replace(taxon, @"\s+(</tp:taxon-name>)", "$1");
						replace1 = Regex.Replace(nc.Value, @"(<tp:nomenclature-citation>)(.*?)(</tp:nomenclature-citation>)", "$1" + taxon + "<comment> $2</comment>$3");
					}
					replace = Regex.Replace(replace, Regex.Escape(nc.Value), replace1);
				}
				
				
				replace = Regex.Replace(replace, @"(</xref>)(\W+?\s?)\s*(\n\s*?<xref[^>]*>)", "$1$3$2");
				replace = Regex.Replace(replace, @"(\s*)(<xref[^>]*>.*?</xref>)(.*?)(<xref[^>]*>)", "$1$2$1$4$3");
				replace = Regex.Replace(replace, @"(\s*)([^<>\n]*?)(<xref[^>]*>)", "$1$3$2");
				xml = Regex.Replace(xml, Regex.Escape(nom.Value), replace);
			}
			
			int maxNumOfObjectId = 6;
			for (int i=0; i<maxNumOfObjectId; i++) {
				xml = Regex.Replace(xml, "(\\s*?)(</tp:taxon-name>)(\n\\s*?<[^>]*?>.*?</[^>]*?>)*?\n\\s*?(<object-id xlink:type=\"simple\">.*</object-id>)", "$1    $4$1$2$3");
			}
			
			// Remove successive titles
			xml = Regex.Replace(xml, @"</title>\s*<title>", "\n                ");
			
			// Format Graphics
			xml = Regex.Replace(xml, @"export\.php_files/", "");
			
			// Format Tables
			xml = Regex.Replace(xml, "<table-wrap position=\"float\" orientation=\"portrait\">(\\s*?(<label>.*?</label>|<caption>.*?</caption>|<label>.*?</label>\\s*?<caption>.*?</caption>))(\\s*?)<table id=\"T(\\d+)\">",
			                         "<table-wrap id=\"T$4\" position=\"float\" orientation=\"portrait\">$1$3<table>");
			
			// Final Format
			xml = Regex.Replace(xml, @"(</name>)\s*,\s*(<name)", "$1$2");
			xml = Regex.Replace(xml, "person-group1", "person-group");
			xml = Regex.Replace(xml, "sec-type=\"Methods\"", "sec-type=\"methods\"");
			xml = Regex.Replace(xml, " unfold=\"true\"", "");
			// Remove blanks and empty lines
			xml = Regex.Replace(xml, @"(\s*?\n)+?", "\n");
		}
	}
}