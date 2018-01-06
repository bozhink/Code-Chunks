using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace PenTagger
{
    class XMLProcessor : FileProcessor
    {
        private const int MaxNumberOfFigures = 2000;
        private int [] figures;
        private int numberOfFigures, maxFigureNumber, numberOfFigPlates;
        private bool isMultipleFigures; // If there are multiple figures on a plate

        public XMLProcessor(string inputFileName, string outputFileName, int numberOfFigures)
        {
            ResetCalss (inputFileName, outputFileName);
            this.numberOfFigures = numberOfFigures;
            figures = new int[this.numberOfFigures+1];
            isMultipleFigures = false;
        }

        public XMLProcessor(string inputFileName, string outputFileName)
        {
            ResetCalss (inputFileName, outputFileName);
            this.numberOfFigures = MaxNumberOfFigures;
            figures = new int[this.numberOfFigures+1];
            isMultipleFigures = false;
        }

        public void TagYear()
        {
            xml = Regex.Replace(xml, "([^0-9](1[6-9][0-9]|20[0-1])[0-9])[^0-9]", "<xref>$1</xref>");
        }

        public void BoldItalicSpaces()
        {
            xml = Regex.Replace(xml, @"(<bold>|<italic>)\s+", " $1");
            xml = Regex.Replace(xml, @"\s+(<bold>|<italic>)", " $1");
            xml = Regex.Replace(xml, @"\s+(</bold>|</italic>)", "$1 ");
            xml = Regex.Replace(xml, @"(</bold>|</italic>)\s+", "$1 ");
            xml = Regex.Replace(xml, @"(</bold>\s+<bold>|</italic>\s+<italic>|<bold>\s+</bold>|<italic>\s+</italic>)", " ");
            xml = Regex.Replace(xml, @"(</bold><bold>|<bold></bold>|</italic><italic>|<italic></italic>)", "");
            xml = Regex.Replace(xml, @"(</italic>|</bold>)(\w)", "$1 $2");
            xml = Regex.Replace(xml, @"(\w)(<italic>|<bold>)", "$1 $2");
            xml = Regex.Replace(xml, @"(</italic>)(<bold>)", "$1 $2");
            xml = Regex.Replace(xml, @"(</bold>)(<italic>)", "$1 $2");
        }

        public void BoldItalic()
        {
            BoldItalicSpaces();
            
            xml = Regex.Replace(xml, @"\&lt;\s*br\s*/\s*\&gt;</(italic|bold)>", "</$1>&lt;br/&gt;");
            xml = Regex.Replace(xml, @"([,;:]+)(</italic>)", "$2$1");
            xml = Regex.Replace(xml, @"(<italic>)([\.,;:]+)", "$2 $1");
            xml = Regex.Replace(xml, @"(<italic>)([A-Z][a-z]{0,2})(</italic>)(\.)", "$1$2$4$3");
            
            xml = Regex.Replace(xml, @"\s*\(\s*(</italic>|</bold>)", "$1 (");
            xml = Regex.Replace(xml, @"(<italic>|<bold>)\s*\)\s*", ") $1");
            xml = Regex.Replace(xml, @"([,\.;:])(<italic>|<bold>)", "$1 $2");
            xml = Regex.Replace(xml, @"(</italic>|</bold>)\s+([,\.;:])", "$1$2 ");
            
            // Genus + species
            //xml = Regex.Replace(xml, @"<italic>([A-Z][a-z\.]+)</italic>(\s*)<italic>([a-z\.\-]+)</italic>", "<italic>$1 $3</italic>");
            // Genus + species + subspecies
            //xml = Regex.Replace(xml, @"<italic>([A-Z][a-z\.]+\s[a-z\.\-]+)</italic>(\s*)<italic>([a-z\.\-]+)</italic>", "<italic>$1 $3</italic>");
            // Genus + (Subgenus)
            xml = Regex.Replace(xml, @"<italic>([A-Z][a-z\.]+)</italic>\s*\(\s*<italic>([A-Z][a-z\.]+)</italic>\s*\)", "<italic>$1 ($2)</italic>");
            // Genus + (Subgenus) + species
            xml = Regex.Replace(xml, @"<italic>([A-Z][a-z\.]+\s\([A-Z][a-z\.]+\))</italic>\s*<italic>([a-z\.\-]+)</italic>", "<italic>$1 $2</italic>");
            // Genus + (Subgenus) + species + subspecies
            //xml = Regex.Replace(xml, @"<italic>([A-Z][a-z\.]+\s\([A-Z][a-z\.]+\)\s[a-z\.\-]+)</italic>(\s*)<italic>([a-z\.\-]+)</italic>", "<italic>$1 $3</italic>");
            // sensu lato & sensu stricto
            xml = Regex.Replace(xml, @"<italic>([A-Za-z\.\(\)\s\-]+)\s*(sensu\s*[a-z\.]*)</italic>", "<italic>$1</italic> <italic>$2</italic>");
            xml = Regex.Replace(xml, @"<italic>([A-Za-z\.\(\)\s\-]+)\s+(s\.\s*[a-z\.]*)</italic>", "<italic>$1</italic> <italic>$2</italic>");
            xml = Regex.Replace(xml, @"<italic>(s(ensu|\.))\s*(l|s)</italic>\.", "<italic>$1 $3.</italic>");
            // Remove empty tags
            xml = Regex.Replace(xml, "(<italic></italic>|<bold></bold>|<source></source>|<sup></sup>)", "");
            // Paste some intervals
            xml = Regex.Replace(xml, "</italic><bold>", "</italic> <bold>");
            // Remove bold and italic around punctuation
            xml = Regex.Replace(xml, @"<(bold|italic)>([,;\.\-\:\s–])</(bold|italic)>", "$2");
            // Split multiple taxa in common italic
            //xml = Regex.Replace(xml, "<italic>([A-Za-z\\(\\)\\.\\s]+)([,;–\\-\\:]\\s*)(.*)</italic>", "<italic>$1</italic>$2<italic>$3</italic>");
            for (int i=0; i<6; i++)
            {
                // Genus[ species[ subspecies]]
                xml = Regex.Replace(xml, @"<italic>([A-Z][a-z\.]+([a-z\.\s]*[a-z])?)\s*([,;\.]\s*)([^<>]*)</italic>", "<italic>$1</italic>$3<italic>$4</italic>");
                // Genus (Subgenus)[ species[ subspecies]]
                xml = Regex.Replace(xml, @"<italic>([A-Z][a-z\.]+\s*\(\s*[A-Z][a-z\.]+\s*\)([a-z\.\s]*[a-z])?)\s*([,;\.]\s*)([^<>]*)</italic>", "<italic>$1</italic>$3<italic>$4</italic>");
            }
            
            xml = Regex.Replace(xml, @"(</italic>)(\()", "$1 $2" );
        }

        public void TitleLabel()
        {
            xml = Regex.Replace(xml, @"(<label>|<title>|<article\-title>|<kwd>|<p>)\s*", "$1");
            xml = Regex.Replace(xml, @"\s*(</label>|</title>|</article\-title>|</kwd>|</p>)", "$1");
            // Format some PageBreaks
            xml = Regex.Replace(xml, @"(\s*)(<kwd>.*)\s*(<!--PageBreak-->)(</kwd>)", "$1$2$4$1$3");
            xml = Regex.Replace(xml, @"<(title|label|kwd|p)>\s*<!--PageBreak--></(title|label|kwd|p)>", "<!--PageBreak-->");

            UnboldTitle();
        }

        public void UnboldTitle()
        {
            Match m = Regex.Match(xml, @"<(title|label|article-title)>(.*?)</(title|label|article-title)>");
            while (m.Success)
            {
                string replace = Regex.Replace(m.Value, "(<bold>|</bold>)", "");
                xml = Regex.Replace(xml, Regex.Escape(m.Value), replace);
                m = m.NextMatch();
            }
        }

        public void FormatSection ()
        {
            xml = Regex.Replace(xml, @"(sec>)\s*(<title>)", "$1$2");
            xml = Regex.Replace(xml, @"\s*(</title>)", "$1");
            xml = Regex.Replace(xml, "sec><title>(.*?)</title>", "sec sec-type=\"$1\"><title>$1</title>");
            int numClearTags = 6;
            for (int i=0; i<numClearTags; i++)
            {
                ClearTagsInSectionAttributes();
            }
        }

        public void ClearMultipleBlanksInParagraph()
        {
            for (Match p = Regex.Match(xml, "<p>.*?</p>"); p.Success; p = p.NextMatch()) {
                string replace = Regex.Replace(p.Value, @"\s+", " ");
                xml = Regex.Replace(xml, Regex.Escape(p.Value), replace);
            }
        }

        public void FormatCloseTags()
        {
            xml = Regex.Replace(xml, @"\s*</(label|title|p|mixed-citation|bold|italic|object-id|xref|kwd|td|ref|caption|th|tp:nomenclature-citation|article-title|self-uri|source|name|given-names|surname|person-group|year|month|day|volume|fpage|lpage|graphic)>", "</$1>");
        }

        public void FormatOpenTags()
        {
            xml = Regex.Replace(xml, @"<(label|title|p|mixed-citation|bold|italic|object-id|xref|kwd|td|ref|caption|th|tp:nomenclature-citation|article-title|self-uri|source|name|given-names|surname|person-group|year|month|day|volume|fpage|lpage|graphic)([^>]*)>\s*", "<$1$2>");
        }

        public void FormatPunctuation()
        {
            // Format brakets
            xml = Regex.Replace(xml, @"\s*\(\s+", " (");
            xml = Regex.Replace(xml, @"\s+\)\s*", ") ");
            xml = Regex.Replace(xml, @"(\)|\])\s+(\)|\])", "$1$2");
            xml = Regex.Replace(xml, @"(\(|\[)\s+(\(|\[)", "$1$2");
            // Format other punctuation
            xml = Regex.Replace(xml, @"\s+([,;:\.])", "$1 ");
            xml = Regex.Replace(xml, @"([,;:\.])\s+", "$1 ");
            xml = Regex.Replace(xml, @"([,\.\:\;])(<italic>|<bold>)", "$1 $2");
        }
        
        public void FormatPageBreaks ()
        {
            xml = Regex.Replace(xml, @"(\s*)(<p>)\s*(<!--PageBreak-->)\s*", "$1$3$1$2");
            xml = Regex.Replace(xml, @"(\s*)<tr[^>]*>\s*<td[^>]*>\s*(<!--PageBreak-->)\s*</td>\s*</tr>", "$1$2");
            xml = Regex.Replace(xml, @"((\s*)<ref [^>]*>.*?)<!--PageBreak-->", "$2<!--PageBreak-->$1");
            xml = Regex.Replace(xml, @"(<italic>(.*?))<!--PageBreak-->", "<!--PageBreak-->$1");
        }

        public void FormatTaxons()
        {
            xml = Regex.Replace(xml, @"((\s*)<tp:taxon-name>)\s*([^\r]*?)\s*(</tp:taxon-name>)", "$1$2    $3$2$4");
            xml = Regex.Replace(xml, @"(<object-id[^>]*>)\s*([^\r]*?)\s*(</object-id>)", "$1$2$3");
            xml = Regex.Replace(xml, @"(<xref>)\s*([^\r]*?)\s*(</xref>)", "$1$2$3");
        }

        public void FormatTablesAndFigures()
        {
            xml = Regex.Replace (xml, "(<table id=\"T(\\d+)\")[^>]*>", "$1>");
            xml = Regex.Replace (xml, @"((\s*)<caption>)\s*", "$1$2    ");
            xml = Regex.Replace (xml, @"(<td ([^>]*)>)\s+", "$1");
            xml = Regex.Replace (xml, @"\s+(</td>)", "$1");
            xml = Regex.Replace (xml, "<table-wrap content-type=\"key\" position=\"float\"", "<table-wrap content-type=\"key\" position=\"anchor\"");
            xml = Regex.Replace (xml, @"<(td|th)[^>]*>\s*<!--PageBreak-->\s*</(td|th)>", "<!--PageBreak-->");
            xml = Regex.Replace (xml, @"<tr>\s*<!--PageBreak-->\s*</tr>", "<!--PageBreak-->");
            // Unbold key tables
            for (Match m = Regex.Match(xml, "(<table-wrap content-type=\"key\"[^>]*>)([^\r]*?)(</table-wrap>)"); m.Success; m = m.NextMatch()) {
                string key = Regex.Replace(m.Value, "<bold>|</bold>", "");
                key = Regex.Replace(key, @"(\s*)(<td [^>]*>)(–|\-|\d+)([A-Za-z])", "$1$2$3</td>$1$2$4");
                xml = Regex.Replace(xml, Regex.Escape(m.Value), key);
                
            }
            // Format wrong figures' labels
            xml = Regex.Replace(xml, @"(\s*)(<caption>)\s*(<p>)\s*<bold>\s*((Figure|Table).*?)\s*</bold>", "$1<label>$4</label>$1$2$3");
        }

        public void ClearTagsFromTags()
        {
            xml = Regex.Replace(xml, "(<[^<>]*)(<[^>]*>)([^<>]*)(</[^>]*>)([^>]*>)", "$1$3$5");
        }

        public void TagWWW ()
        {
            Match mp = Regex.Match (xml, "(<p>.*?</p>|<th>.*?</th>|<td>.*?</td>|<mixed-citation [^>]*>.*?</mixed-citation>)");
            while (mp.Success) {
                string replace = mp.Value;
                replace = Regex.Replace (replace, "(([a-z0-9_]*[\\.:@\\-])*([a-z0-9_]+)\\.(com|net|org|info|eu|uk|us|cn|gov|edu|ar|br)(:\\d+)?(/)?([^<>\n\"\\s]*[A-Za-z0-9/])?)", "<ext-link ext-link-type=\"uri\" xlink:href=\"http://$1\">$1</ext-link>");
                replace = Regex.Replace (replace, "((http(s?)|(s?)ftp)://)<ext\\-link [^>]*>([^<]*)</ext\\-link>", "$1$5");
                replace = Regex.Replace (replace, "(http(s?)://([a-z0-9_]*[\\.:@\\-])*([a-z0-9_]+)\\.([a-z]{2,4})(:\\d+)?(/[^<>\n\"\\s]*[A-Za-z0-9/])?)", "<ext-link ext-link-type=\"uri\" xlink:href=\"$1\">$1</ext-link>");
                replace = Regex.Replace (replace, "((s?)ftp://([a-z0-9_]*[\\.:@\\-])*([a-z0-9_]+)\\.([a-z]{2,4})(:\\d+)?(/[^<>\n\"\\s]*[A-Za-z0-9/])?)", "<ext-link ext-link-type=\"uri\" xlink:href=\"$1\">$1</ext-link>");
                xml = Regex.Replace(xml, Regex.Escape(mp.Value), replace);
                mp = mp.NextMatch();
            }
            // Tag IP addresses
            xml = Regex.Replace(xml, "(http(s?)://((\\d{1,3}\\.){3,3}\\d{1,3})(:\\d+)?(/[^<>\n\"\\s]*[A-Za-z0-9/])?)", "<ext-link ext-link-type=\"uri\" xlink:href=\"$1\">$1</ext-link>");
            xml = Regex.Replace(xml, "((s?)ftp://((\\d{1,3}\\.){3,3}\\d{1,3})(:\\d+)?(/[^<>\n\"\\s]*[A-Za-z0-9/])?)", "<ext-link ext-link-type=\"uri\" xlink:href=\"$1\">$1</ext-link>");

            int maxTagInTag = 10;
            for (int i=0; i<maxTagInTag; i++)
            {
                ClearTagsFromTags();
            }
            
            for (Match email = Regex.Match(xml, @"<email[^>]*>.*?</email>"); email.Success; email = email.NextMatch()) {
                string replace = Regex.Replace(email.Value, @"</?[^>]*>", "");
                xml = Regex.Replace(xml, Regex.Escape(email.Value), "<email xlink:type=\"simple\">" + replace + "</email>");
            }
            for (Match email = Regex.Match(xml, @"<email[^>]*>.*?</email>"); email.Success; email = email.NextMatch()) {
                string replace = Regex.Replace(email.Value, @"(<email[^>]*>)\s*", "$1");
                replace = Regex.Replace(replace, @"\s*(</email>)", "$1");
                replace = Regex.Replace(replace, @"(\w)(\W)\s+?(\w)", "$1</email>$2 <email xlink:type=\"simple\">$3");
                xml = Regex.Replace(xml, Regex.Escape(email.Value), replace);
            }
        }

        public void TagDOI()
        {
            // Remove blanks around brackets spanning numbers
            xml = Regex.Replace(xml, @"(\d)\s(\(|\[)([A-Z0-9]+)(\]|\))\s(\d)", "$1$2$3$4$5");
            // Tag DOI
            xml = Regex.Replace(xml, @"doi:(\s*)([^,<\s]*[A-Za-z0-9])", "doi: <ext-link ext-link-type=\"uri\" xlink:href=\"http://dx.doi.org/$2\">$2</ext-link>");
            // Some ormat
            xml = Regex.Replace(xml, "(</source>)(doi:)", "$1 $2");
        }

        public void GetFigures ()
        {
            Match m = Regex.Match(xml, @"<fig [^>]*>\s*<label>\s*(Figure|Plate)[^<]*</label>");
            int fig = 1;
            for (int i=0; i<numberOfFigures+1; i++)
            {
                figures[i]=0;
            }
            maxFigureNumber = 0;
            while (m.Success)
            {
                Match mfig = Regex.Match(m.Value, @"\d+");
                mfig = mfig.NextMatch(); // Skip the number in <fig id="F\d+"
                while (mfig.Success)
                {
                    try
                    {
                        int fign = int.Parse(mfig.Value);
                        figures[fign] = fig;
                        if (fign > maxFigureNumber) maxFigureNumber = fign;
                    }
                    catch (IndexOutOfRangeException e)
                    {
                        Console.WriteLine("The entered number of figures is insufficient!\n" + e.Message);
                        System.Environment.Exit(1);
                    }
                    //Console.WriteLine(mfig.Value + " " + mfig.Index);
                    mfig = mfig.NextMatch();
                }
                //Console.WriteLine(m.Value);
                m = m.NextMatch();
                fig++;
            }
            numberOfFigPlates = fig;
            isMultipleFigures = false;
            for (int i = 1; i <= maxFigureNumber; i++)
            {
                if (figures[i]==0)
                {
                    figures[i] = figures[i-1];
                    isMultipleFigures = true;
                }
            }
            for (int i=0; i<maxFigureNumber+1; i++)
            {
                Console.WriteLine("The figure #{0} is on plate #{1}", i, figures[i]);
            }
        }

        public void TagFiguresAndTables()
        {
            int maxNumberOfSequentalFloats = 30;
            int maxNumberOfPunctuationSigns = 10;
            // Force Fig. and Figs
            xml = Regex.Replace(xml, @"(Fig)\s", "$1. ");
            xml = Regex.Replace(xml, @"(Figs)\.", "$1");
            // Tag Figures and Tables
            xml = Regex.Replace (xml, "(Fig\\.|Figure|Map|Plate)\\s*(\\d+)(\\s*([A-Za-z]\\s*([,;\\-–]|and|\\&amp;)\\s*)*[A-Za-z])?(\\W)", "<xref ref-type=\"fig\" rid=\"F$2\">$1 $2$3</xref>$6");
            xml = Regex.Replace (xml, "(Tab\\.|Table)\\s*(\\d+)(\\s*([A-Za-z]?))(\\W)", "<xref ref-type=\"table\" rid=\"T$2\">$1 $2$3</xref>$5");
            xml = Regex.Replace (xml, "(Figs|Figures|Maps|Plates)\\s*(\\d+)(\\s*([A-Za-z]\\s*([,;\\-–]|and|\\&amp;)\\s*)*[A-Za-z])?(\\W)", "<xref ref-type=\"fig\" rid=\"F$2\">$1 $2$3</xref>$6");
            xml = Regex.Replace (xml, "(Tabs|Tables)\\s*(\\d+)(\\s*([A-Za-z]\\s*([,;\\-–]|and|\\&amp;)\\s*)*[A-Za-z])?(\\W)", "<xref ref-type=\"table\" rid=\"T$2\">$1 $2$3</xref>$6");
            for (int i=0; i<maxNumberOfSequentalFloats; i++)
            {
                xml = Regex.Replace (xml, "(<xref ref-type=\"fig\" [^>]*>[^<]*</xref>)(\\s*([,;\\-–]|and|\\&amp;)\\s*)(\\d+)(\\s*([A-Za-z]\\s*([,;\\-–]|and|\\&amp;)\\s*)*[A-Za-z])?(\\W)", "$1$2<xref ref-type=\"fig\" rid=\"F$4\">$4$5</xref>$8");
                xml = Regex.Replace (xml, "(<xref ref-type=\"table\" [^>]*>[^<]*</xref>)(\\s*([,;\\-–]|and|\\&amp;)\\s*)(\\d+)(\\s*([A-Za-z]\\s*([,;\\-–]|and|\\&amp;)\\s*)*[A-Za-z])?(\\W)", "$1$2<xref ref-type=\"table\" rid=\"T$4\">$4$5</xref>$8");
            }
            // Remove <xref> from titles and labels
            for (int i=0; i<maxNumberOfSequentalFloats; i++)
            {
                xml = Regex.Replace(xml, "(<label>|<title>)(.*)<xref([^>]*)>(.*)</xref>(.*)(</label>|</title>)", "$1$2$4$5$6");
            }
            // Format the content in <xref></xref>
            xml = Regex.Replace(xml, "(<xref [^>]*>[^<>]*\\d+)\\s+([A-Za-z][^<>]*</xref>)", "$1$2");
            for (int i=0; i<maxNumberOfPunctuationSigns; i++)
            {
                xml = Regex.Replace(xml, "(<xref [^>]*>[^<>]*[A-Za-z])\\s*([,;])\\s*([A-Za-z][^<>]*</xref>)", "$1$2 $3");
                xml = Regex.Replace(xml, "(<xref [^>]*>[^<>]*[A-Za-z])\\s*([\\-–])\\s*([A-Za-z][^<>]*</xref>)", "$1$2$3");
                xml = Regex.Replace(xml, "(<xref [^>]*>[^<>]*[A-Za-z])\\s*(and|\\&amp;)\\s*([A-Za-z][^<>]*</xref>)", "$1 $2 $3");
            }
            // Format content between </xref> and <xref
            xml = Regex.Replace(xml, "(</xref>)\\s*([\\-–])\\s*(<xref)", "$1$2$3");
            xml = Regex.Replace(xml, "(</xref>)\\s*([,;])\\s*(<xref)", "$1$2 $3");
            xml = Regex.Replace(xml, "(</xref>)\\s*(and|\\&amp;)\\s*(<xref)", "$1 $2 $3");
            //
            // If there are multiple figures on a plate change the rid of xrefs
            //
            string pattern="", replace="";
            if (isMultipleFigures)
            {
                for (int i = 1; i <= maxFigureNumber; i++)
                {
                    if (figures[i] != i)
                    {
                        pattern = "<xref ref\\-type=\"fig\" rid=\"F" + i + "\">";
                        replace = "<xref ref-type=\"fig\" rid=\"F" + figures[i] + "\">";
                        xml = Regex.Replace(xml, pattern, replace);
                    }
                }
            }
            for (int i = 1; i < numberOfFigPlates; i++)
            {
                pattern = "(<xref ref-type=\"fig\" rid=\"F" + i + "\">[^<]*)</xref>(\\,\\s*|\\;\\s*|\\s*\\-\\s*|\\s*–\\s*|\\s*and\\s*|\\s*\\&amp;\\s*)<xref ref\\-type=\"fig\" rid=\"F" + i + "\">([^<]*</xref>)";
                replace = "$1$2$3";
                for (int j = 0; j < maxNumberOfSequentalFloats; j++) {
                    xml = Regex.Replace(xml, pattern, replace);
                }
            }
            // Remove double <xref>
            xml = Regex.Replace(xml, "<xref>(<xref(.*?)</xref>)</xref>", "$1");
        }

        public void TagCoordinates()
        {
            // Format deg symbol
            xml = Regex.Replace(xml, "(\\d)([º°˚]|<sup>o</sup>)", "$1°");
            // Tag coordinates
            xml = Regex.Replace(xml, @"(\d+\.\d+[NSEW])\s*\,?\s*(\d+\.\d+[NSEW])", "<named-content content-type=\"dwc:verbatimCoordinates\">$1, $2</named-content>");
            xml = Regex.Replace(xml, @"((\d+\.)?\d+°[^<>]{0,20}?[SWNE])\s*?\W?\s*((\d+\.)?\d+°[^</>]{0,20}?[SWNE])", "<named-content content-type=\"dwc:verbatimCoordinates\">$1, $3</named-content>");
            //
            xml = Regex.Replace(xml, @"([NSEW])((\d+\.)?\d+°\d+(\.\d+)?\'(\d+(\.\d+)?\&quot;)?)\s*?\W?\s*([NSEW])((\d+\.)?\d+°\d+(\.\d+)?\'(\d+(\.\d+)?\&quot;)?)", "<named-content content-type=\"dwc:verbatimCoordinates\">$2$1, $8$7</named-content>");
            // Remove some blank spaces
            xml = Regex.Replace(xml, "(<named-content [^>]*>)([^<>]*)°\\s*([^<>]*)°\\s*([^<>]*)(</named-content>)", "$1$2°$3°$4$5");
        }

        public void ClearTagsInSectionAttributes()
        {
            xml = Regex.Replace(xml, "(?<=sec-type=\")(.*?)(<[^<]+?>)(.*?)(?=\")", "$1$3");
        }

        public void FormatSections()
        {
            xml = Regex.Replace(xml, "sec>(\\s*)<title>", "sec><title>");
            xml = Regex.Replace(xml, "sec><title>(.*?)</title>", "sec sec-type=\"$1\"><title>$1</title>");
            xml = Regex.Replace(xml, "[\\.:;]\\s*?\"><", "\"><");
            for (int i = 0; i < 6; i++) {
                xml = Regex.Replace(xml, "(?<=sec-type=\")(.*?)(<[^<]+?>)(.*?)(?=\")", "$1$3");
            }
            xml = Regex.Replace(xml, "treatment-sec sec-type=\"Distribution(.*?)\">", "treatment-sec sec-type=\"Distribution\">");
        }

        public void FormatReferances()
        {
            xml = Regex.Replace(xml, "<ref id=\"(\\d+)\"", "<ref id=\"B$1\"");
            xml = Regex.Replace(xml, @"(\S)(<article-title>)", "$1 $2");
            xml = Regex.Replace(xml, @"(\S)(<source>)", "$1 $2");
            xml = Regex.Replace(xml, @"(</source>)(\S)", "$1 $2");
            xml = Regex.Replace(xml, @"(</surname>)(\s*)(<given-names>)", "$1 $3");
        }

        public void InitialFormat()
        {
            //
            // Remove bold-italic tag
            //
            xml = Regex.Replace(xml, "<bold-italic>", "<bold><italic>");
            xml = Regex.Replace(xml, "</bold-italic>", "</italic></bold>");
            //
            // Remove fake-tags
            //
            xml = Regex.Replace(xml, "<fake_tag>", "<source>");
            xml = Regex.Replace(xml, "</fake_tag>", "</source> ");
            //
            // Figures and tables tag
            //
            xml = Regex.Replace(xml, "<(article_figs_and_tables)([^>]*)>", "<$1>");
            //
            // Remove blanks in front of close-tags and behind open-tags
            //
            FormatCloseTags();
            FormatOpenTags();
            //
            // Process bold and italic
            //
            BoldItalic();
            //
            // Remove bold from titles
            //
            TitleLabel();
            //
            // Sections
            //
            FormatSections();
            //
            // Insert some intervals
            //
            xml = Regex.Replace(xml, @"([^\(\[])\s*(<italic>|<bold>)\s*", "$1 $2");
            xml = Regex.Replace(xml, @"([\(\[])\s*(<italic>|<bold>|<underline>|<sub>|<sup>)\s*", "$1$2");
            xml = Regex.Replace(xml, @"(\s?)\s*?(</italic>|</bold>|</underline>|</sub>|</sup>)([^,;\)\]\.])", "$2$1$3");
            xml = Regex.Replace(xml, @"\s*(</italic>|</bold>|</underline>|</sub>|</sup>)\s*([,;\)\]\.])\s*", "$1$2 ");
            //
            // References
            //
            FormatReferances();
            //
            // Tables
            //
            FormatTablesAndFigures();
            //
            // Format PageBreaks
            //
            FormatPageBreaks();
            // Post-formatting
            for (int i = 0; i < 3; i++)
            {
                BoldItalic();
                FormatPunctuation();
                FormatCloseTags();
                FormatOpenTags();
            }
            xml = Regex.Replace(xml, @"(<bold>|<italic>)([,\.;\-–])(</bold>|</italic>)", "$2");
            // Clear empty symbols out of <article> tag
            xml = Regex.Replace(xml, @"(</article>)(\s*)", "$1");
            //
            xml = Regex.Replace(xml, @"<\s+/", "</");
        }

        public void FinalFormat()
        {
            Match mFront = Regex.Match(xml, "<front>([^\r]*)</front>");
            Match mBack = Regex.Match(xml, "<back>([^\r]*)</back>");
            string replace = mFront.Value;
            replace = Regex.Replace (replace, "((\\s*)<(publisher|title-group|pub-date[^>]*|permissions|kwd-group)>)(.*)", "$1$2    $4");
            replace = Regex.Replace (replace, "((\\s*)<name name-style=\"western\">)(<surname>(.*)</surname>) (<given-names>(.*)</given-names>)(</name>)", "$1$2    $3$2    $5$2$7");
            xml = Regex.Replace(xml, Regex.Escape(mFront.Value), replace);
            replace = Regex.Replace (mBack.Value, "((\\s*)<ref-list>)(.*)", "$1$2    $3");
            replace = Regex.Replace (replace, @"\s*<ack>\s*(<title>References</title>)\s*</ack>(\s*)(<ref\-list>)", "$2$3$2    $1");
            xml = Regex.Replace(xml, Regex.Escape(mBack.Value), replace);
            // Some body replaces
            xml = Regex.Replace(xml, @"((\s*)<tp:nomenclature-citation-list>)(<tp:nomenclature-citation>)", "$1$2    $3");
            // Remove some empty tags
            xml = Regex.Replace(xml, @"<source>\s*</source>", "");
            // Remove empty lines
            xml = Regex.Replace(xml, @"\n\s*\n", "\n");
            // sensu lato & stricto
            xml = Regex.Replace(xml, @"(<italic>)((s\.|sens?u?)\s+[sl][a-z]*)(</italic>)\.", "$1$2.$4");
            //
            xml = Regex.Replace(xml, @"<\s+/", "</");
            //
            FormatPageBreaks();
        }

        private Regex findTaxa = new Regex(@"<tp:taxon-name[^>\-]*>(.*?)</tp:taxon-name>");
        private Regex findLowerTaxa = new Regex(@"<italic><tp:taxon-name[^>\-]*>(.*?)</tp:taxon-name></italic>");
        private Regex FindLowerTaxa = new Regex(@"<italic><tp:taxon-name[^>\-]*>([^\r]*?)</tp:taxon-name></italic>");
        private Regex findHigherTaxa = new Regex(@"(?<!<italic>)<tp:taxon-name>(.*?)</tp:taxon-name>");
        private Regex findNomenclature = new Regex(@"<tp:nomenclature>([^\r]*?)</tp:nomenclature>");

        public void SplitLowerTaxa()
        {
            Match lowerTaxa = findLowerTaxa.Match(xml);
            string replace ="";
            while (lowerTaxa.Success)
            {
                //Console.WriteLine(lowerTaxa.Value);
                replace = lowerTaxa.Value;
                // Genus species subspecies
                replace = Regex.Replace(replace, @"(<italic><tp:taxon-name[^>]*>)([A-Z][a-z\.]+)\s+([a-z\.\-]+)\s+([a-z\.\-]+)(</tp:taxon-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> <tp:taxon-name-part taxon-name-part-type=\"species\">$3</tp:taxon-name-part> <tp:taxon-name-part taxon-name-part-type=\"subspecies\">$4</tp:taxon-name-part>$5");
                // Genus species
                replace = Regex.Replace(replace, @"(<italic><tp:taxon-name[^>]*>)([A-Z][a-z\.]+)\s+([a-z\.\-]+)(</tp:taxon-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> <tp:taxon-name-part taxon-name-part-type=\"species\">$3</tp:taxon-name-part>$4");
                // Genus (Subgenus) species subspecies
                replace = Regex.Replace(replace, @"(<italic><tp:taxon-name[^>]*>)([A-Z][a-z\.]+)\s+\(\s*([A-Z][a-z\.]+)\s*\)\s+([a-z\.\-]+)\s+([a-z\.\-]+)(</tp:taxon-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> (<tp:taxon-name-part taxon-name-part-type=\"subgenus\">$3</tp:taxon-name-part>) <tp:taxon-name-part taxon-name-part-type=\"species\">$4</tp:taxon-name-part> <tp:taxon-name-part taxon-name-part-type=\"subspecies\">$5</tp:taxon-name-part>$6");
                // Genus (Subgenus) species
                replace = Regex.Replace(replace, @"(<italic><tp:taxon-name[^>]*>)([A-Z][a-z\.]+)\s+\(\s*([A-Z][a-z\.]+)\s*\)\s+([a-z\.\-]+)(</tp:taxon-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> (<tp:taxon-name-part taxon-name-part-type=\"subgenus\">$3</tp:taxon-name-part>) <tp:taxon-name-part taxon-name-part-type=\"species\">$4</tp:taxon-name-part>$5");
                // Genus (Subgenus)
                replace = Regex.Replace(replace, @"(<italic><tp:taxon-name[^>]*>)([A-Z][a-z\.]+)\s+\(\s*([A-Z][a-z\.]+)\s*\)\s*(</tp:taxon-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> (<tp:taxon-name-part taxon-name-part-type=\"subgenus\">$3</tp:taxon-name-part>)$4");
                // Genus
                replace = Regex.Replace(replace, @"(<italic><tp:taxon-name[^>]*>)([A-Z][a-z\.]+)(</tp:taxon-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part>$3");
                xml = Regex.Replace(xml, Regex.Escape(lowerTaxa.Value), replace);
                lowerTaxa = lowerTaxa.NextMatch();
            }
        }

        public void SplitHigherTaxa()
        {
            Match higherTaxa = findHigherTaxa.Match(xml);
            string patternPrefix = "(<tp:taxon-name>)([A-Z][a-z]*"; string patternSuffix = ")(</tp:taxon-name>)";
            string replacePrefix = "$1<tp:taxon-name-part taxon-name-part-type=\""; string replaceSuffix = "\">$2</tp:taxon-name-part>$3";
            string taxon = "";
            string suffix = "";
            while (higherTaxa.Success)
            {
                // Phylum
                taxon = "phylum";
                suffix = "phyta|mycota";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Subphylum
                taxon = "subphylum";
                suffix = "phytina|mycotina";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Class
                taxon = "class";
                suffix = "ia|opsida|phyceae|mycetes";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Subclass
                taxon = "subclass";
                suffix = "idae|phycidae|mycetidae";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Superorder
                taxon = "superorder";
                suffix = "anae";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Order
                taxon = "order";
                suffix = "ales";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Suborder
                taxon = "suborder";
                suffix = "ineae";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Infraorder
                taxon = "infraorder";
                suffix = "aria";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Superfamily
                taxon = "superfamily";
                suffix = "acea|oidea";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Epifamily
                taxon = "epifamily";
                suffix = "oidae";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Family
                taxon = "family";
                suffix = "aceae|idae";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Subfamily
                taxon = "subfamily";
                suffix = "oideae|inae";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Infrafamily
                taxon = "infrafamily";
                suffix = "odd";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Tribe
                taxon = "tribe";
                suffix = "eae|ini";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Subtribe
                taxon = "subtribe";
                suffix = "inae|ina";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);
                // Infratribe
                taxon = "infratribe";
                suffix = "ad";
                xml = Regex.Replace(xml, patternPrefix + suffix + patternSuffix, replacePrefix + taxon + replaceSuffix);

                higherTaxa = higherTaxa.NextMatch();
            }
        }

        public void UnSplitTaxa()
        {
            Match taxon = findTaxa.Match(xml);
            while (taxon.Success)
            {
                string replace = Regex.Replace(taxon.Value, "<tp:taxon-name-part [^>]*>", "");
                replace = Regex.Replace(replace, "</tp:taxon-name-part>", "");
                xml = Regex.Replace(xml, Regex.Escape(taxon.Value), replace);
                taxon = taxon.NextMatch();
            }
        }

        public void FormatTreatments()
        {
            string pattern, replace;
            xml = Regex.Replace(xml, @"(<tp:taxon-name>)\s*", "$1");
            xml = Regex.Replace(xml, @"\s*(</tp:taxon-name>)", "$1");
            // Extract label preceding lower taxa and Authority and Status tags
            pattern = @"(\s*)(<tp:taxon-name>)<bold>(.+?)\s*<italic>(.+?)</italic>\s*(.*?)</bold>(</tp:taxon-name>)";
            replace = "$1<label>$3</label>$1<italic>$2$4$6</italic>$1<taxon-authority-status>$5</taxon-authority-status>";
            xml = Regex.Replace(xml, pattern, replace);
            // Extract Authority and Status tags if there is no label
            pattern = @"(\s*)(<tp:taxon-name>)<bold>\s*<italic>(.+?)</italic>\s*(.*?)</bold>(</tp:taxon-name>)";
            replace = "$1<italic>$2$3$5</italic>$1<taxon-authority-status>$4</taxon-authority-status>";
            xml = Regex.Replace(xml, pattern, replace);
            // Split lower taxa
            SplitLowerTaxa();
            //
            // Higher taxa
            // See http://en.wikipedia.org/wiki/Taxonomic_rank#Terminations_of_names
            //
            string patternPrefix1 = "((\\s*)<tp:taxon-name>)<bold>\\s*([A-Z][a-z]*(";
            string patternPrefix2 = "((\\s*)<tp:taxon-name>)<bold>(.*?)\\s+([A-Z][a-z]*(";
            string patternSuffix = "))\\s*(.*?)</bold>(</tp:taxon-name>)";
            string replacePrefix1 = "$1$2    <tp:taxon-name-part taxon-name-part-type=\"";
            string replacePrefix2 = "$2<label>$3</label>$1$2    <tp:taxon-name-part taxon-name-part-type=\"";
            string replaceSuffix1 = "\">$3</tp:taxon-name-part>$2$6$2<taxon-authority-status>$5</taxon-authority-status>";
            string replaceSuffix2 = "\">$4</tp:taxon-name-part>$2$7$2<taxon-authority-status>$6</taxon-authority-status>";
            string taxon = "";
            string suffix = "";
            // Phylum
            taxon = "phylum";
            suffix = "phyta|mycota";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Subphylum
            taxon = "subphylum";
            suffix = "phytina|mycotina";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Class
            taxon = "class";
            suffix = "ia|opsida|phyceae|mycetes";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Subclass
            taxon = "subclass";
            suffix = "idae|phycidae|mycetidae";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Superorder
            taxon = "superorder";
            suffix = "anae";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Order
            taxon = "order";
            suffix = "ales";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Suborder
            taxon = "suborder";
            suffix = "ineae";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Infraorder
            taxon = "infraorder";
            suffix = "aria";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Superfamily
            taxon = "superfamily";
            suffix = "acea|oidea";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Epifamily
            taxon = "epifamily";
            suffix = "oidae";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Family
            taxon = "family";
            suffix = "aceae|idae";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Subfamily
            taxon = "subfamily";
            suffix = "oideae|inae";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Infrafamily
            taxon = "infrafamily";
            suffix = "odd";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Tribe
            taxon = "tribe";
            suffix = "eae|ini";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Subtribe
            taxon = "subtribe";
            suffix = "inae|ina";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            // Infratribe
            taxon = "infratribe";
            suffix = "ad";
            xml = Regex.Replace(xml, patternPrefix1+suffix+patternSuffix, replacePrefix1+taxon+replaceSuffix1);
            xml = Regex.Replace(xml, patternPrefix2+suffix+patternSuffix, replacePrefix2+taxon+replaceSuffix2);
            //
            // Format nomenclature
            //
            Match nomenclature = findNomenclature.Match(xml);
            while (nomenclature.Success)
            {
                replace = Regex.Replace(nomenclature.Value, @"(\s*)(<italic>)?(<tp:taxon-name>)(<tp:taxon-name-part[^\r]*?)(</tp:taxon-name>)(</italic>)?", "$1$3$1    $4$1$5");
                for (int i=0; i<4; i++)
                {
                    replace = Regex.Replace(replace, @"(\n\s*)(\(?<tp:taxon-name-part [^>]*>.*?</tp:taxon-name-part>\)?) (\(?<tp:taxon-name-part [^>]*>.*?</tp:taxon-name-part>\)?)", "$1$2$1$3");
                }
                xml = Regex.Replace(xml, Regex.Escape(nomenclature.Value), replace);
                nomenclature = nomenclature.NextMatch();
            }
            //
            // Split authority and status
            //
            UnboldTitle(); // For correction
            xml = Regex.Replace(xml, @"(<taxon\-authority\-status>)\s*<bold>", "$1"); // For correction
            xml = Regex.Replace(xml, @"<taxon\-authority\-status>((([a-z]+\.(\s*)(n|nov))|(n\.\s*[a-z]+)|(([a-z]+\.)?(\s*)spp))(\.)?)</taxon\-authority\-status>", "<tp:taxon-status>$1</tp:taxon-status>");
            xml = Regex.Replace(xml, @"(\s*)<taxon\-authority\-status>([\w\-\,\;\.\(\)\&\s-]+)(\s*\W\s*)([a-z]+\.\s*(n|nov)(\.)?)</taxon\-authority\-status>", "$1<tp:taxon-authority>$2</tp:taxon-authority>$1<tp:taxon-status>$4</tp:taxon-status>");
            xml = Regex.Replace(xml, @"<taxon\-authority\-status>([^\d]+\d{4,4})</taxon\-authority\-status>", "<tp:taxon-authority>$1</tp:taxon-authority>");
            xml = Regex.Replace(xml, @"<taxon\-authority\-status>(\([^\d]+\d{4,4}\))</taxon\-authority\-status>", "<tp:taxon-authority>$1</tp:taxon-authority>");
            xml = Regex.Replace(xml, @"<taxon\-authority\-status>(.*?)</taxon\-authority\-status>", "<tp:taxon-authority>$1</tp:taxon-authority>"); // For correction
            //xml = Regex.Replace(xml, @"<tp:taxon\-authority>(.*)([\s,;:]+)</tp:taxon\-authority>", "<tp:taxon-authority>$1</tp:taxon-authority>");
            xml = Regex.Replace(xml, @"(<tp:taxon-authority>)\s+?", "$1");
            xml = Regex.Replace(xml, @"\s+(</tp:taxon-authority>)", "$1");
        }

        private string [] unTag = {"China", "\\w*china", "Sabina", "Dodd", "Mvini", "Carolina", "Wallacea", "\\w*stina", "Rosalina",
                                   "Medina", "Barina", "Mal[vw]ina", "Cat[ae]rina", "Argentina", "Molina", "Neblina", "Padina", "Vagina",
                                   "Esquina", "General", "Features?", "Chemistry", "Holotype", "Paratypes?", "Lectotypes?", "Pedipalps?",
                                   "Prosoma", "Morphology", "Colou?ration", "Chelicerae", "Alu", "Mesosoma", "Metasoma", "Size", "Shape",
                                   "Structures?", "Surface", "Head", "Legs?", "Head", "Wings?", "Antenna", "Integument", "Prodorsum", "Notogaster",
                                   "Gnathosoma", "Anogenital", "Labium", "Prothorax", "Colou?r", "Male", "Female", "Structure", "Measurements",
                                   "Pilosity", "Body", "Pronotum", "Scutellum", "Fore", "Thoracic", "Abdomen", "Pleonites?", "Urosomite", "Antennule",
                                   "Mandibles", "Maxillule", "Maxilla", "Maxilliped", "Casini", "Uropod", "Pars", "In", "Ex", "Nina",
                                   "Upper", "Lower", "Mandible", "Maxilla", "Maxilliped", "Gnathopod", "Pereopod", "Allotype", "Other",
                                   "Epimera", "Telson", "Ekaterina", "Irina"}; 

        public void TagLowerTaxa()
        {
            string rep = "<italic><tp:taxon-name>$1</tp:taxon-name></italic>";
            for (Match m = Regex.Match(xml, "<(p|th|td|title|tp:nomenclature-citation)[^>]*>.*?</(p|th|td|title|tp:nomenclature-citation)>"); m.Success; m = m.NextMatch())
            {
                // Genus (Subgenus)? species subspecies?
                string replace = Regex.Replace(m.Value, @"<italic>([A-Z][a-z\.]+\s*[a-z-]*)</italic>", rep);
                replace = Regex.Replace(replace, @"<italic>([A-Z][a-z\.]+\s*[a-z\.-]+\s*[a-z-]+)</italic>", rep);
                replace = Regex.Replace(replace, @"<italic>([A-Z][a-z\.]+\s*\(\s*[A-Z][a-z\\.]+\s*\)\s*[a-z-]*)</italic>", rep);
                replace = Regex.Replace(replace, @"<italic>([A-Z][a-z\.]+\s*\(\s*[A-Z][a-z\.]+\s*\)\s*[a-z\.-]+\s*[a-z-]+)</italic>", rep);
                xml = Regex.Replace(xml, Regex.Escape(m.Value), replace);
            }
            // Some final format
            Match m1 = Regex.Match(xml, @"(?<=<tp:taxon-name>).*?(?=</tp:taxon-name>)");
            while (m1.Success)
            {
                string replace = Regex.Replace(m1.Value, @"(\.)(\w)", "$1 $2");
                xml = Regex.Replace(xml, Regex.Escape(m1.Value), replace);
                m1 = m1.NextMatch();
            }
        }

        public void TagHigherTaxa()
        {
            string pattern = "(([A-Z][a-z]*(morpha|ieae|indeae|eriae|idea|ineae|aceae|oideae|oidea|oidae|idae|inae|odd|ini|ina|anae|ineae|acea|oideae|mycota|mycotina|mycetes|mycetidae|phyta|phytina|opsida|phyceae|idae|phycidae|ptera|poda|phaga|itae))|Insecta|Alismatales|Passeriformes|Porifera|Demospongiae|Hadromerida|Acari|Polydesmida|Hydrachnidia|Scorpiones|Oribatida|Terebrantia|Poinsettia|Thrips|Odonata|Animalia|Apocrita|Annelida|Oligochaeta)(\\W)";
            string replace = "<tp:taxon-name>$1</tp:taxon-name>$4";
            Match m = Regex.Match(xml, "<(p|th|td|title|tp:nomenclature-citation)[^>]*>.*?</(p|th|td|title|tp:nomenclature-citation)>");
            while (m.Success)
            {
                string newReplace = Regex.Replace(m.Value, pattern, replace);
                xml = Regex.Replace(xml, Regex.Escape(m.Value), newReplace);
                m = m.NextMatch();
            }
            for (int i=0; i<5; i++)
            {
                ClearTagsFromTags();
            }
            // Restore caused damages
            pattern = "<tp:taxon-name>([^<>]*)<tp:taxon-name>([^<>]*)</tp:taxon-name>([^<>]*)</tp:taxon-name>";
            replace = "<tp:taxon-name>$1$2$3</tp:taxon-name>";
            xml = Regex.Replace(xml, pattern, replace);
        }

        public void UntagTaxa ()
        {
            string line = "";
            for (int i=0; i<unTag.Length; i++) {
                line = unTag[i];
                xml = Regex.Replace(xml, "<tp:taxon-name>(" + line + "(\\s+.*?)?)</tp:taxon-name>", "$1");
            }
        }

        public void SetTaxonRangsInTaxonNames()
        {
            Match lowerTaxa = Regex.Match(xml, @"<italic><tp:taxon\-name[^>]*>(.*?)</tp:taxon\-name></italic>");
            string replace ="";
            while (lowerTaxa.Success)
            {
                //Console.WriteLine(lowerTaxa.Value);
                replace = lowerTaxa.Value;
                // Genus species subspecies
                replace = Regex.Replace(replace, @"(<italic><tp:taxon\-name[^>]*>)([A-Z][a-z\.]+)\s+([a-z\.\-]+)\s+([a-z\.\-]+)(</tp:taxon\-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> <tp:taxon-name-part taxon-name-part-type=\"species\">$3</tp:taxon-name-part> <tp:taxon-name-part taxon-name-part-type=\"subspecies\">$4</tp:taxon-name-part>$5");
                // Genus species
                replace = Regex.Replace(replace, @"(<italic><tp:taxon\-name[^>]*>)([A-Z][a-z\.]+)\s+([a-z\.\-]+)(</tp:taxon\-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> <tp:taxon-name-part taxon-name-part-type=\"species\">$3</tp:taxon-name-part>$4");
                // Genus (Subgenus) species subspecies
                replace = Regex.Replace(replace, @"(<italic><tp:taxon\-name[^>]*>)([A-Z][a-z\.]+)\s+\(\s*([A-Z][a-z\.]+)\s*\)\s+([a-z\.\-]+)\s+([a-z\.\-]+)(</tp:taxon\-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> (<tp:taxon-name-part taxon-name-part-type=\"subgenus\">$3</tp:taxon-name-part>) <tp:taxon-name-part taxon-name-part-type=\"species\">$4</tp:taxon-name-part> <tp:taxon-name-part taxon-name-part-type=\"subspecies\">$5</tp:taxon-name-part>$6");
                // Genus (Subgenus) species
                replace = Regex.Replace(replace, @"(<italic><tp:taxon\-name[^>]*>)([A-Z][a-z\.]+)\s+\(\s*([A-Z][a-z\.]+)\s*\)\s+([a-z\.\-]+)(</tp:taxon\-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part> (<tp:taxon-name-part taxon-name-part-type=\"subgenus\">$3</tp:taxon-name-part>) <tp:taxon-name-part taxon-name-part-type=\"species\">$4</tp:taxon-name-part>$5");
                // Genus
                replace = Regex.Replace(replace, @"(<italic><tp:taxon\-name[^>]*>)([A-Z][a-z\.]+)(</tp:taxon\-name></italic>)", "$1<tp:taxon-name-part taxon-name-part-type=\"genus\">$2</tp:taxon-name-part>$3");
                xml = Regex.Replace(xml, Regex.Escape(lowerTaxa.Value), replace);
                lowerTaxa = lowerTaxa.NextMatch();
            }
        }

        public void UnFoldShortenedGenera()
        {
            Match m = Regex.Match(xml, @"(?<=(<tp:taxon-name))(>[A-Z][a-z]*\.\s*[a-z\-]*?<)(?=/tp:taxon-name>)");
            while (m.Success)
            {
                Match genus = Regex.Match(m.Value, @"(?<=>)[A-Z][a-z]*(?=\.)");
                Match species = Regex.Match(m.Value, @"(?<=\s)[a-z\-]+(?=<)");
                Console.WriteLine("\n{2}:\tGenus = {0}.\tSpecies = {1}", genus.Value, species.Value, m.Value);
                string find = "(?<=(<tp:taxon\\-name))(>" + genus.Value + "[a-z]+\\s*" + species.Value + "<)(?=/tp:taxon\\-name>)";
                Match getName = Regex.Match(xml, find);
                if (getName.Success)
                {
                    string replace = " unfold=\"true\"" + getName.Value;
                    Console.WriteLine("\tThe string \"{0}\" will be replaced by \"{1}\"", m.Value, replace);
                    xml = Regex.Replace(xml, Regex.Escape(m.Value), replace);
                }
                while (getName.Success)
                {
                    Console.WriteLine("\t\tMatch found:\t{0}", getName.Value);
                    getName = getName.NextMatch();
                }
                m = m.NextMatch();
            }
        }

        private Regex GenusName = new Regex("(?<=<tp:taxon-name-part taxon-name-part-type=\"genus\">)[A-Z][a-z\\.]+(?=</tp:taxon-name-part>)");
        private Regex SubgenusName = new Regex("(?<=<tp:taxon-name-part taxon-name-part-type=\"subgenus\">)[A-Z][a-z\\.]+(?=</tp:taxon-name-part>)");
        private Regex SpeciesName = new Regex("(?<=<tp:taxon-name-part taxon-name-part-type=\"species\">)[a-z\\-\\.]+(?=</tp:taxon-name-part>)");
        private Regex SubspeciesName = new Regex("(?<=<tp:taxon-name-part taxon-name-part-type=\"subspecies\">)[a-z\\-]+(?=</tp:taxon-name-part>)");

        public void SubgenusBrackets()
        {
            xml = Regex.Replace(xml, "(\\()(<tp:taxon-name-part taxon-name-part-type=\"subgenus\">)([A-Z][a-z\\.]+)(</tp:taxon-name-part>)(\\))",
                                     "$2 $1$3$5 $4");
        }

        public void StableExpand()
        {
            // In this method it is supposed that the subspecies name is not shortened
            Console.WriteLine("\n# StableExpand will be executed...");

            Match m = findLowerTaxa.Match(xml);
            while (m.Success)
            {
                string replace    = m.Value;
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";

                if (String.Compare(genus, "")==0)
                {
                    Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value);
                    return;
                }

                // Select only shortened taxa with non-zero species name
                if ((m.Value.IndexOf('.')>-1) && String.Compare(species, "")!=0)
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    Match taxon = FindLowerTaxa.Match(xml);
                    while (taxon.Success)
                    {
                        string replace1    = m.Value;
                        Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                        Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                        Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                        Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";

                        // We are interested only on non-shortened lower taxa
                        if ((taxon.Value.IndexOf('.')<0) && (String.Compare(subspecies, subspecies1)==0))
                        {
                            string gen  = (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z\\-]+?" : genus;
                            string sgen = (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z\\-]+?" : subgenus;
                            string sp   = (species.IndexOf('.')>-1) ? species.Substring(0, species.Length-1) + "[a-z\\-]+?" : species;

                            Match mgen  = Regex.Match(genus1, gen);
                            Match msgen = Regex.Match(subgenus1, sgen);
                            Match msp   = Regex.Match(species1, sp);
                            
                            // Check if the subgenus is empty
                            if (String.Compare(subgenus, "")==0)
                            {
                                if (mgen.Success && msp.Success)
                                {
                                    if (String.Compare(subgenus1, "")==0)
                                    {
                                        replace1 = Regex.Replace(replace1,
                                            Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                            "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus1 + "</tp:taxon-name-part>");
                                        replace1 = Regex.Replace(replace1,
                                            Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                            "<tp:taxon-name-part taxon-name-part-type=\"species\">" + species1 + "</tp:taxon-name-part>");
                                        Console.WriteLine("\tSubstitution\t| {0}\t{2}\t{3} | {4}\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                        replace = Regex.Replace(replace1, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                                    }
                                    else
                                    {
                                        Console.WriteLine("\tThere is a genus-species coincidence but the subgenus does not match:");
                                        Console.WriteLine("\t\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                        Console.WriteLine("\t\tSubstitution will not be done!");
                                    }
                                }
                            }
                            else
                            {
                                if (mgen.Success && msgen.Success && msp.Success)
                                {
                                    replace1 = Regex.Replace(replace1,
                                        Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                        "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus1 + "</tp:taxon-name-part>");
                                    replace1 = Regex.Replace(replace1,
                                        Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                        "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus1 + "</tp:taxon-name-part>");
                                    replace1 = Regex.Replace(replace1,
                                        Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                        "<tp:taxon-name-part taxon-name-part-type=\"species\">" + species1 + "</tp:taxon-name-part>");
                                    Console.WriteLine("\tSubstitution\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                    replace = Regex.Replace(replace1, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                                }
                            }
                        }
                        taxon = taxon.NextMatch();
                    }
                    xml = Regex.Replace(xml, Regex.Escape(m.Value), replace);
                }
                m = m.NextMatch();
            }
        }

        public const string lGenus = "<tp:taxon-name-part taxon-name-part-type=\"genus\">";
        public const string rGenus = "</tp:taxon-name-part>";
        public const string lSubgenus = "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">";
        public const string rSubgenus = "</tp:taxon-name-part>";
        public const string lSpecies = "<tp:taxon-name-part taxon-name-part-type=\"species\">";
        public const string rSpecies = "</tp:taxon-name-part>";
        public const string lSubspecies = "<tp:taxon-name-part taxon-name-part-type=\"subspecies\">";
        public const string rSubspecies = "</tp:taxon-name-part>";
        

        public void UnstableExpand(int stage)
        {
            Console.WriteLine("\n\n# UnstableExpand...\n#\n# STAGE {0}\n#\n\n", stage);
            
            string [] division = {"paragraph", "treatment section", "treatment", "section", "beginning", "all"};
            string [] pattern = {"<p>.*?", "<tp:treatment-sec[^\r]*?", "<tp:taxon-treatment>[^\r]*?", "<sec[^\r]*?", "<?xml[^\r]*?", "[^\r]*"};
            
            for (Match m = findLowerTaxa.Match(xml); m.Success; m = m.NextMatch())
            {
                Species sp = new Species(m.Value);
                if (sp.isGenusNull) { Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value); return; }
                
                string xgenus = (sp.genus.IndexOf('.')>-1) ? sp.genus.Substring(0, sp.genus.Length-1) + "[a-z]+?" : "SKIP";
                string xsubgenus = (sp.subgenus.IndexOf('.')>-1) ? sp.subgenus.Substring(0, sp.subgenus.Length-1) + "[a-z]+?" : "SKIP";
                string xspecies = (sp.species.IndexOf('.')>-1) ? sp.species.Substring(0, sp.species.Length-1) + "[a-z]+?" : "SKIP";

                // Select only shortened taxa with non-zero species name
                if (sp.isShortened && !sp.isSpeciesNull)
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0}", sp.AsString());
                    // Scan all lower-taxon names in the article
                    // TODO
                    Match div = Regex.Match(xml, "<p>.*?" + Regex.Escape(m.Value));
                    if (div.Success)
                    {
                        // TODO
                        Console.WriteLine("Paragraph content:\n\t{0}\n", div.Value);
                        bool isFound = false;
                        Species spl = new Species();
                        for (Match taxon = FindLowerTaxa.Match(div.Value); taxon.Success; taxon = taxon.NextMatch()) {
                            Species sp1 = new Species (taxon.Value);
                            Match mgen  = Regex.Match(sp1.genus, xgenus);       if (mgen.Success)  { spl.SetGenus(sp1);    isFound = true; }
                            Match msgen = Regex.Match(sp1.subgenus, xsubgenus); if (msgen.Success) { spl.SetSubgenus(sp1); isFound = true; }
                            Match msp   = Regex.Match(sp1.species, xspecies);   if (msp.Success)   { spl.SetSpecies(sp1);  isFound = true; }
                            Console.WriteLine("........ Found: genus {0} | subgenus {1} | species {2}", sp1.genus, sp1.subgenus, sp1.species);
                        }
                        if (isFound) {
                            Console.WriteLine("________ Substitution '{0}, ({1}), {2}'  by '{3}, ({4}), {5}'.", sp.genus, sp.subgenus, sp.species, spl.genus, spl.subgenus, spl.species);
                            string replace = Regex.Replace(m.Value, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                            if (!spl.isGenusNull) {
                                replace = Regex.Replace(replace, Regex.Escape(lGenus + sp.genus + rGenus), lGenus + spl.genus + rGenus);
                            }
                            if (!spl.isSubgenusNull) {
                                replace = Regex.Replace(replace, Regex.Escape(lSubgenus + sp.subgenus + rSubgenus), lSubgenus + spl.subgenus + rSubgenus);
                            }
                            if (!spl.isSpeciesNull) {
                                replace = Regex.Replace(replace, Regex.Escape(lSpecies + sp.species + rSpecies), lSpecies + spl.species + rSpecies);
                            }
                            xml = Regex.Replace(xml, Regex.Escape(div.Value), Regex.Replace(div.Value, Regex.Escape(m.Value), replace));
                        } else {
                            Console.WriteLine("________ No suitable genus name has been found in the current division.");
                        }
                    }
                    else
                    {
                        Console.WriteLine("This species is not in such a division or is already unfolded");
                    }
                    Console.WriteLine("\n");
                }
            }
        }

        public void UnstableExpand1()
        {
            Console.WriteLine("\n\n# UnstableExpand...\n");
            Console.WriteLine("\n\n#\n# STAGE 1\n#\n\n");
            // On the first stage try to expand all quasi-stable cases like
            // [Genus] ([Subgenus].) species ~~ [Genus]. ([Subenus]) species ~~ [Genus]. ([Subgenus].) species
            Match m = findLowerTaxa.Match(xml);
            while (m.Success)
            {
                string replace    = m.Value;
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";

                if (String.Compare(genus, "")==0)
                {
                    Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value);
                    return;
                }

                // Select only shortened taxa with non-zero species name
                if ((m.Value.IndexOf('.')>-1) && String.Compare(species, "")!=0)
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    bool found = false;
                    string replace1    = m.Value;
                    Match taxon = FindLowerTaxa.Match(xml);
                    while (taxon.Success)
                    {
                        Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                        Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                        Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                        Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";

                        //
                        if (String.Compare(subspecies, subspecies1)==0)
                        {// We are interested only in coincident subspecies names
                            if (String.Compare(species, species1)==0)
                            {// First process all taxa with coincident species names
                                if (String.Compare(subgenus, subgenus1)==0)
                                {//... and coincident subgenus names, i.e. try to find suitable genus names
                                    Match mgen = Regex.Match(genus1, (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z\\-]+?" : "SKIP");
                                    if (mgen.Success)
                                    {
                                        replace1 = Regex.Replace(replace1,
                                            Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                            "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus1 + "</tp:taxon-name-part>");
                                        Console.WriteLine("\tSubstitution\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                        found = true;
                                    }
                                }
                                if (String.Compare(genus, genus1)==0)
                                {//... and coincident genus names, i.e. try to find suitable subgenus names
                                    Match msgen = Regex.Match(subgenus1, (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z\\-]+?" : "SKIP");
                                    if (msgen.Success)
                                    {
                                        replace1 = Regex.Replace(replace1,
                                            Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                            "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + subgenus1 + "</tp:taxon-name-part>");
                                        Console.WriteLine("\tSubstitution\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                        found = true;
                                    }
                                }
                            }
                            if (String.Compare(genus, genus1)==0)
                            {// First process all taxa with coincident genus names
                                if (String.Compare(subgenus, subgenus1)==0)
                                {//... and coincident subgenus names, i.e. try to find suitable genus names
                                    Match msp = Regex.Match(species1, (species.IndexOf('.')>-1) ? species.Substring(0, species.Length-1) + "[a-z\\-]+?" : "SKIP");
                                    if (msp.Success)
                                    {
                                        replace1 = Regex.Replace(replace1,
                                            Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                            "<tp:taxon-name-part taxon-name-part-type=\"species\">" + species1 + "</tp:taxon-name-part>");
                                        Console.WriteLine("\tSubstitution\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                        found = true;
                                    }
                                }
                            }
                        }
                        taxon = taxon.NextMatch();
                    }
                    if (found) replace = Regex.Replace(replace1, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                    //if (found) Console.WriteLine("\n{0}\n{1}\n", m.Value, replace);
                    xml = Regex.Replace(xml, Regex.Escape(m.Value), replace);
                }
                m = m.NextMatch();
            }
        }

        public void UnstableExpand2()
        {
            Console.WriteLine("\n\n# UnstableExpand...\n");
            Console.WriteLine("\n\n#\n# STAGE 2\n#\n\n");
            // On the second stage try to expand all genus-subgenus abbreviations [Genus]. ([Subgenus].)
            Match m = findLowerTaxa.Match(xml);
            while (m.Success)
            {
                string replace    = m.Value;
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";

                if (String.Compare(genus, "")==0)
                {
                    Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value);
                    return;
                }

                // Select only shortened taxa with non-zero species and subgenus name
                if ((genus.IndexOf('.')>-1) && (subgenus.IndexOf('.')<0) && (String.Compare(subgenus, "")!=0) && (String.Compare(species, "")!=0))
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    bool found = false;
                    string replace1 = m.Value;
                    Match taxon = FindLowerTaxa.Match(xml);
                    while (taxon.Success)
                    {
                        Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                        Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                        Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                        Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";

                        if (String.Compare(genus, genus1)==0 && String.Compare(subgenus, subgenus1)!=0)
                        {
                            Match msgen = Regex.Match(subgenus1, (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z\\-]+?" : subgenus);
                            if (msgen.Success)
                            {
                                replace1 = Regex.Replace(replace1,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus1 + "</tp:taxon-name-part>");
                                Console.WriteLine("\tSubstitution\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                found = true;
                            }
                        }
                        if (String.Compare(subgenus, subgenus1)==0 && String.Compare(genus, genus1)!=0)
                        {
                            Match mgen = Regex.Match(genus1, (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z\\-]+?" : genus);
                            if (mgen.Success)
                            {
                                replace1 = Regex.Replace(replace1,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus1 + "</tp:taxon-name-part>");
                                Console.WriteLine("\tSubstitution\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                found = true;
                            }
                        }
                        taxon = taxon.NextMatch();
                    }
                    if (found) replace = Regex.Replace(replace1, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                    //if (found) Console.WriteLine("\n{0}\n{1}\n", m.Value, replace);
                    xml = Regex.Replace(xml, Regex.Escape(m.Value), replace);
                }
                //
                //
                // Select only shortened taxa with non-zero species and subgenus name
                if ((genus.IndexOf('.')<0) && (subgenus.IndexOf('.')>-1) && (String.Compare(subgenus, "")!=0) && (String.Compare(species, "")!=0))
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    bool found = false;
                    string replace1 = m.Value;
                    Match taxon = FindLowerTaxa.Match(xml);
                    while (taxon.Success)
                    {
                        Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                        Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                        Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                        Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";

                        if (String.Compare(genus, genus1)==0 && String.Compare(subgenus, subgenus1)!=0)
                        {
                            Match msgen = Regex.Match(subgenus1, (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z\\-]+?" : subgenus);
                            if (msgen.Success)
                            {
                                replace1 = Regex.Replace(replace1,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus1 + "</tp:taxon-name-part>");
                                Console.WriteLine("\tSubstitution\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                found = true;
                            }
                        }
                        if (String.Compare(subgenus, subgenus1)==0 && String.Compare(genus, genus1)!=0)
                        {
                            Match mgen = Regex.Match(genus1, (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z\\-]+?" : genus);
                            if (mgen.Success)
                            {
                                replace1 = Regex.Replace(replace1,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus1 + "</tp:taxon-name-part>");
                                Console.WriteLine("\tSubstitution\t| {0}\t({1})\t{2}\t{3} | {4}\t({5})\t{6}\t {7}", genus, subgenus, species, subspecies, genus1, subgenus1, species1, subspecies1);
                                found = true;
                            }
                        }
                        taxon = taxon.NextMatch();
                    }
                    if (found) replace = Regex.Replace(replace1, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                    //if (found) Console.WriteLine("\n{0}\n{1}\n", m.Value, replace);
                    xml = Regex.Replace(xml, Regex.Escape(m.Value), replace);
                }
                m = m.NextMatch();
            }
        }

        public void UnstableExpand3()
        {
            Console.WriteLine("\n\n# UnstableExpand...\n");
            Console.WriteLine("\n\n#\n# STAGE 3: Look in paragraphs\n#\n\n");
            for (Match m = findLowerTaxa.Match(xml); m.Success; m = m.NextMatch())
            {
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";
                if (String.Compare(genus, "")==0) { Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value); return; }
                
                string xgenus = (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z]+?" : "SKIP";
                string xsubgenus = (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z]+?" : "SKIP";
                string xspecies = (species.IndexOf('.')>-1) ? species.Substring(0, species.Length-1) + "[a-z]+?" : "SKIP";

                // Select only shortened taxa with non-zero species name
                if ((m.Value.IndexOf('.')>-1) && (String.Compare(species, "")!=0))
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    Match paragraph = Regex.Match(xml, "<p>.*?" + Regex.Escape(m.Value));
                    if (paragraph.Success)
                    {
                        Console.WriteLine("Paragraph content:\n\t{0}\n", paragraph.Value);
                        string lastGenus = "";
                        string lastSubgenus = "";
                        string lastSpecies = "";
                        bool isFound = false;
                        for (Match taxon = FindLowerTaxa.Match(paragraph.Value); taxon.Success; taxon = taxon.NextMatch())
                        {
                            Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                            Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                            Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                            //Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";
                            
                            Match mgen  = Regex.Match(genus1, xgenus);       if (mgen.Success)  { lastGenus    = genus1;    isFound = true; }
                            Match msgen = Regex.Match(subgenus1, xsubgenus); if (msgen.Success) { lastSubgenus = subgenus1; isFound = true; }
                            Match msp   = Regex.Match(species1, xspecies);   if (msp.Success)   { lastSpecies  = species1;  isFound = true; }
                            Console.WriteLine("........ Found in paragraph: genus {0} | subgenus {1} | species {2}", genus1, subgenus1, species1);
                        }
                        if (isFound)
                        {
                            Console.WriteLine("\n\tSubstitution '{0}, ({1}), {2}'  by '{3}, ({4}), {5}' in the current paragraph.\n", genus, subgenus, species, lastGenus, lastSubgenus, lastSpecies);
                            string replace = Regex.Replace(m.Value, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                            if (String.Compare(lastGenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + lastGenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSubgenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + lastSubgenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSpecies, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"species\">" + lastSpecies + "</tp:taxon-name-part>");
                            }
                            xml = Regex.Replace(xml,
                                Regex.Escape(paragraph.Value),
                                Regex.Replace(paragraph.Value, Regex.Escape(m.Value), replace));
                        }
                        else
                        {
                            Console.WriteLine("\n\tNo suitable genus name has been found in the current paragraph.\n");
                        }
                    }
                    else
                    {
                        Console.WriteLine("This species is not in a paragraph or is already unfolded");
                    }
                    Console.WriteLine("\n");
                }
            }
        }

        public void UnstableExpand4()
        {
            Console.WriteLine("\n\n# UnstableExpand...\n");
            Console.WriteLine("\n\n#\n# STAGE 4: look in treatment sections\n#\n\n");
            for (Match m = findLowerTaxa.Match(xml); m.Success; m = m.NextMatch())
            {
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";
                if (String.Compare(genus, "")==0) { Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value); return; }
                
                string xgenus = (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z]+?" : "SKIP";
                string xsubgenus = (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z]+?" : "SKIP";
                string xspecies = (species.IndexOf('.')>-1) ? species.Substring(0, species.Length-1) + "[a-z]+?" : "SKIP";

                // Select only shortened taxa with non-zero species name
                if ((m.Value.IndexOf('.')>-1) && (String.Compare(species, "")!=0))
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    Match paragraph = Regex.Match(xml, "<tp:treatment-sec[^\r]*?" + Regex.Escape(m.Value));
                    if (paragraph.Success)
                    {
                        //Console.WriteLine("Paragraph content:\n\t{0}\n", paragraph.Value);
                        string lastGenus = "";
                        string lastSubgenus = "";
                        string lastSpecies = "";
                        bool isFound = false;
                        for (Match taxon = FindLowerTaxa.Match(paragraph.Value); taxon.Success; taxon = taxon.NextMatch())
                        {
                            Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                            Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                            Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                            //Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";
                            
                            Match mgen  = Regex.Match(genus1, xgenus);       if (mgen.Success)  { lastGenus    = genus1;    isFound = true; }
                            Match msgen = Regex.Match(subgenus1, xsubgenus); if (msgen.Success) { lastSubgenus = subgenus1; isFound = true; }
                            Match msp   = Regex.Match(species1, xspecies);   if (msp.Success)   { lastSpecies  = species1;  isFound = true; }
                            Console.WriteLine("........ Found in treatment section: genus {0} | subgenus {1} | species {2}", genus1, subgenus1, species1);
                        }
                        if (isFound)
                        {
                            Console.WriteLine("\n\tSubstitution '{0}, ({1}), {2}'  by '{3}, ({4}), {5}' in the current treatment section.\n", genus, subgenus, species, lastGenus, lastSubgenus, lastSpecies);
                            string replace = Regex.Replace(m.Value, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                            if (String.Compare(lastGenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + lastGenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSubgenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + lastSubgenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSpecies, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"species\">" + lastSpecies + "</tp:taxon-name-part>");
                            }
                            xml = Regex.Replace(xml,
                                Regex.Escape(paragraph.Value),
                                Regex.Replace(paragraph.Value, Regex.Escape(m.Value), replace));
                        }
                        else
                        {
                            Console.WriteLine("\n\tNo suitable genus name has been found in the current treatment section.\n");
                        }
                    }
                    else
                    {
                        Console.WriteLine("This species is not in a treatment section or is already unfolded");
                    }
                    Console.WriteLine("\n");
                }
            }
        }

        public void UnstableExpand5()
        {
            Console.WriteLine("\n\n# UnstableExpand...\n");
            Console.WriteLine("\n\n#\n# STAGE 5: look in treatments\n#\n\n");
            for (Match m = findLowerTaxa.Match(xml); m.Success; m = m.NextMatch())
            {
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";
                if (String.Compare(genus, "")==0) { Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value); return; }
                
                string xgenus = (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z]+?" : "SKIP";
                string xsubgenus = (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z]+?" : "SKIP";
                string xspecies = (species.IndexOf('.')>-1) ? species.Substring(0, species.Length-1) + "[a-z]+?" : "SKIP";

                // Select only shortened taxa with non-zero species name
                if ((m.Value.IndexOf('.')>-1) && (String.Compare(species, "")!=0))
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    Match paragraph = Regex.Match(xml, "<tp:taxon-treatment>[^\r]*?" + Regex.Escape(m.Value));
                    if (paragraph.Success)
                    {
                        //Console.WriteLine("Paragraph content:\n\t{0}\n", paragraph.Value);
                        string lastGenus = "";
                        string lastSubgenus = "";
                        string lastSpecies = "";
                        bool isFound = false;
                        for (Match taxon = FindLowerTaxa.Match(paragraph.Value); taxon.Success; taxon = taxon.NextMatch())
                        {
                            Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                            Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                            Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                            //Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";
                            
                            Match mgen  = Regex.Match(genus1, xgenus);       if (mgen.Success)  { lastGenus    = genus1;    isFound = true; }
                            Match msgen = Regex.Match(subgenus1, xsubgenus); if (msgen.Success) { lastSubgenus = subgenus1; isFound = true; }
                            Match msp   = Regex.Match(species1, xspecies);   if (msp.Success)   { lastSpecies  = species1;  isFound = true; }
                            Console.WriteLine("........ Found in treatment: genus {0} | subgenus {1} | species {2}", genus1, subgenus1, species1);
                        }
                        if (isFound)
                        {
                            Console.WriteLine("\n\tSubstitution '{0}, ({1}), {2}'  by '{3}, ({4}), {5}' in the current treatment.\n", genus, subgenus, species, lastGenus, lastSubgenus, lastSpecies);
                            string replace = Regex.Replace(m.Value, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                            if (String.Compare(lastGenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + lastGenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSubgenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + lastSubgenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSpecies, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"species\">" + lastSpecies + "</tp:taxon-name-part>");
                            }
                            xml = Regex.Replace(xml,
                                Regex.Escape(paragraph.Value),
                                Regex.Replace(paragraph.Value, Regex.Escape(m.Value), replace));
                        }
                        else
                        {
                            Console.WriteLine("\n\tNo suitable genus name has been found in the current treatment.\n");
                        }
                    }
                    else
                    {
                        Console.WriteLine("This species is not in a treatment or is already unfolded");
                    }
                    Console.WriteLine("\n");
                }
            }
        }

        public void UnstableExpand6()
        {
            Console.WriteLine("\n\n# UnstableExpand...\n");
            Console.WriteLine("\n\n#\n# STAGE 6: look in sections\n#\n\n");
            for (Match m = findLowerTaxa.Match(xml); m.Success; m = m.NextMatch())
            {
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";
                if (String.Compare(genus, "")==0) { Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value); return; }
                
                string xgenus = (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z]+?" : "SKIP";
                string xsubgenus = (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z]+?" : "SKIP";
                string xspecies = (species.IndexOf('.')>-1) ? species.Substring(0, species.Length-1) + "[a-z]+?" : "SKIP";

                // Select only shortened taxa with non-zero species name
                if ((m.Value.IndexOf('.')>-1) && (String.Compare(species, "")!=0))
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    Match paragraph = Regex.Match(xml, "<sec[^\r]*?" + Regex.Escape(m.Value));
                    if (paragraph.Success)
                    {
                        //Console.WriteLine("Paragraph content:\n\t{0}\n", paragraph.Value);
                        string lastGenus = "";
                        string lastSubgenus = "";
                        string lastSpecies = "";
                        bool isFound = false;
                        for (Match taxon = FindLowerTaxa.Match(paragraph.Value); taxon.Success; taxon = taxon.NextMatch())
                        {
                            Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                            Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                            Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                            //Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";
                            
                            Match mgen  = Regex.Match(genus1, xgenus);       if (mgen.Success)  { lastGenus    = genus1;    isFound = true; }
                            Match msgen = Regex.Match(subgenus1, xsubgenus); if (msgen.Success) { lastSubgenus = subgenus1; isFound = true; }
                            Match msp   = Regex.Match(species1, xspecies);   if (msp.Success)   { lastSpecies  = species1;  isFound = true; }
                            Console.WriteLine("........ Found in section: genus {0} | subgenus {1} | species {2}", genus1, subgenus1, species1);
                        }
                        if (isFound)
                        {
                            Console.WriteLine("\n\tSubstitution '{0}, ({1}), {2}'  by '{3}, ({4}), {5}' in the current section.\n", genus, subgenus, species, lastGenus, lastSubgenus, lastSpecies);
                            string replace = Regex.Replace(m.Value, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                            if (String.Compare(lastGenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + lastGenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSubgenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + lastSubgenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSpecies, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"species\">" + lastSpecies + "</tp:taxon-name-part>");
                            }
                            xml = Regex.Replace(xml,
                                Regex.Escape(paragraph.Value),
                                Regex.Replace(paragraph.Value, Regex.Escape(m.Value), replace));
                        }
                        else
                        {
                            Console.WriteLine("\n\tNo suitable genus name has been found in the current section.\n");
                        }
                    }
                    else
                    {
                        Console.WriteLine("This species is not in a section or is already unfolded");
                    }
                    Console.WriteLine("\n");
                }
            }
        }

        public void UnstableExpand7()
        {
            Console.WriteLine("\n\n# UnstableExpand...\n");
            Console.WriteLine("\n\n#\n# STAGE 7: WARNING: search from the beginnig\n#\n\n");
            for (Match m = findLowerTaxa.Match(xml); m.Success; m = m.NextMatch())
            {
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";
                if (String.Compare(genus, "")==0) { Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value); return; }
                
                string xgenus = (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z]+?" : "SKIP";
                string xsubgenus = (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z]+?" : "SKIP";
                string xspecies = (species.IndexOf('.')>-1) ? species.Substring(0, species.Length-1) + "[a-z]+?" : "SKIP";

                // Select only shortened taxa with non-zero species name
                if ((m.Value.IndexOf('.')>-1) && (String.Compare(species, "")!=0))
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    Match paragraph = Regex.Match(xml, "<?xml[^\r]*?" + Regex.Escape(m.Value));
                    if (paragraph.Success)
                    {
                        //Console.WriteLine("Paragraph content:\n\t{0}\n", paragraph.Value);
                        string lastGenus = "";
                        string lastSubgenus = "";
                        string lastSpecies = "";
                        bool isFound = false;
                        for (Match taxon = FindLowerTaxa.Match(paragraph.Value); taxon.Success; taxon = taxon.NextMatch())
                        {
                            Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                            Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                            Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                            //Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";
                            
                            Match mgen  = Regex.Match(genus1, xgenus);       if (mgen.Success)  { lastGenus    = genus1;    isFound = true; }
                            Match msgen = Regex.Match(subgenus1, xsubgenus); if (msgen.Success) { lastSubgenus = subgenus1; isFound = true; }
                            Match msp   = Regex.Match(species1, xspecies);   if (msp.Success)   { lastSpecies  = species1;  isFound = true; }
                            Console.WriteLine("........ Found in preceding text: genus {0} | subgenus {1} | species {2}", genus1, subgenus1, species1);
                        }
                        if (isFound)
                        {
                            Console.WriteLine("\n\tSubstitution '{0}, ({1}), {2}'  by '{3}, ({4}), {5}' in the current preceding text.\n", genus, subgenus, species, lastGenus, lastSubgenus, lastSpecies);
                            string replace = Regex.Replace(m.Value, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                            if (String.Compare(lastGenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + lastGenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSubgenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + lastSubgenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSpecies, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"species\">" + lastSpecies + "</tp:taxon-name-part>");
                            }
                            xml = Regex.Replace(xml,
                                Regex.Escape(paragraph.Value),
                                Regex.Replace(paragraph.Value, Regex.Escape(m.Value), replace));
                        }
                        else
                        {
                            Console.WriteLine("\n\tNo suitable genus name has been found in the preceding text.\n");
                        }
                    }
                    else
                    {
                        Console.WriteLine("This species is not in the preceding text");
                    }
                    Console.WriteLine("\n");
                }
            }
        }

        public void UnstableExpand8()
        {
            Console.WriteLine("\n\n# UnstableExpand...\n");
            Console.WriteLine("\n\n#\n# STAGE 8: WARNING: search in the whole article\n#\n\n");
            for (Match m = findLowerTaxa.Match(xml); m.Success; m = m.NextMatch())
            {
                Match mgenus      = GenusName.Match(m.Value);      string genus      = mgenus.Success ? mgenus.Value : "";
                Match msubgenus   = SubgenusName.Match(m.Value);   string subgenus   = msubgenus.Success ? msubgenus.Value : "";
                Match mspecies    = SpeciesName.Match(m.Value);    string species    = mspecies.Success ? mspecies.Value : "";
                Match msubspecies = SubspeciesName.Match(m.Value); string subspecies = msubspecies.Success ? msubspecies.Value : "";
                if (String.Compare(genus, "")==0) { Console.WriteLine("\nERROR: Empty genus name found!:\n{0}\n", m.Value); return; }
                
                string xgenus = (genus.IndexOf('.')>-1) ? genus.Substring(0, genus.Length-1) + "[a-z]+?" : "SKIP";
                string xsubgenus = (subgenus.IndexOf('.')>-1) ? subgenus.Substring(0, subgenus.Length-1) + "[a-z]+?" : "SKIP";
                string xspecies = (species.IndexOf('.')>-1) ? species.Substring(0, species.Length-1) + "[a-z]+?" : "SKIP";

                // Select only shortened taxa with non-zero species name
                if ((m.Value.IndexOf('.')>-1) && (String.Compare(species, "")!=0))
                {
                    Console.WriteLine("\nNext shortened taxon:\t{0} ({1}) {2} {3}", genus, subgenus, species, subspecies);
                    // Scan all lower-taxon names in the article
                    Match paragraph = Regex.Match(xml, "<sec[^\r]*?" + Regex.Escape(m.Value));
                    if (paragraph.Success)
                    {
                        string lastGenus = "";
                        string lastSubgenus = "";
                        string lastSpecies = "";
                        bool isFound = false;
                        for (Match taxon = FindLowerTaxa.Match(paragraph.Value); taxon.Success; taxon = taxon.NextMatch())
                        {
                            Match mgenus1      = GenusName.Match(taxon.Value);      string genus1      = mgenus1.Success ? mgenus1.Value : "";
                            Match msubgenus1   = SubgenusName.Match(taxon.Value);   string subgenus1   = msubgenus1.Success ? msubgenus1.Value : "";
                            Match mspecies1    = SpeciesName.Match(taxon.Value);    string species1    = mspecies1.Success ? mspecies1.Value : "";
                            //Match msubspecies1 = SubspeciesName.Match(taxon.Value); string subspecies1 = msubspecies1.Success ? msubspecies1.Value : "";
                            
                            Match mgen  = Regex.Match(genus1, xgenus);       if (mgen.Success)  { lastGenus    = genus1;    isFound = true; }
                            Match msgen = Regex.Match(subgenus1, xsubgenus); if (msgen.Success) { lastSubgenus = subgenus1; isFound = true; }
                            Match msp   = Regex.Match(species1, xspecies);   if (msp.Success)   { lastSpecies  = species1;  isFound = true; }
                            Console.WriteLine("........ Found in the article: genus {0} | subgenus {1} | species {2}", genus1, subgenus1, species1);
                        }
                        if (isFound)
                        {
                            Console.WriteLine("\n\tSubstitution '{0}, ({1}), {2}'  by '{3}, ({4}), {5}' in the article.\n", genus, subgenus, species, lastGenus, lastSubgenus, lastSpecies);
                            string replace = Regex.Replace(m.Value, @"<tp:taxon-name[^>\-]*>", "<tp:taxon-name unfold=\"true\">");
                            if (String.Compare(lastGenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"genus\">" + genus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"genus\">" + lastGenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSubgenus, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + subgenus + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"subgenus\">" + lastSubgenus + "</tp:taxon-name-part>");
                            }
                            if (String.Compare(lastSpecies, "")!=0)
                            {
                                replace = Regex.Replace(replace,
                                    Regex.Escape("<tp:taxon-name-part taxon-name-part-type=\"species\">" + species + "</tp:taxon-name-part>"),
                                    "<tp:taxon-name-part taxon-name-part-type=\"species\">" + lastSpecies + "</tp:taxon-name-part>");
                            }
                            xml = Regex.Replace(xml,
                                Regex.Escape(paragraph.Value),
                                Regex.Replace(paragraph.Value, Regex.Escape(m.Value), replace));
                        }
                        else
                        {
                            Console.WriteLine("\n\tNo suitable genus name has been found in the article.\n");
                        }
                    }
                    else
                    {
                        Console.WriteLine("This species is not in the article or is already unfolded");
                    }
                    Console.WriteLine("\n");
                }
            }
        }

        public void UnstableUnfold()
        {
            string genusPrefix = "<tp:taxon-name-part taxon-name-part-type=\"genus\">";
            string genusSuffix = "</tp:taxon-name-part>";
            string genusNPrefix = "(?<=" + genusPrefix + ")";
            string genusNSuffix = "(?=" + genusSuffix + ")";
            string genusSpeciesPattern = "<tp:taxon-name[^>]*?><tp:taxon-name-part taxon-name-part-type=\"genus\">[A-Z][a-z]*\\.</tp:taxon-name-part>\\s*<tp:taxon-name-part taxon-name-part-type=\"species\">.*?</tp:taxon-name-part></tp:taxon-name>";
            
            // Print all recognized genera in the article
            Console.WriteLine();
            Match genus = Regex.Match(xml, genusNPrefix + "[A-Z][a-z\\.]+?" + genusNSuffix);
            while (genus.Success)
            {
                Console.WriteLine("Found genus: {0}", genus.Value);
                genus = genus.NextMatch();
            }
            //
            Console.Write("\n\n\n\n\n");
            // Show only genera in the current paragraph
            Match genSp = Regex.Match(xml, genusSpeciesPattern);
            while (genSp.Success)
            {
                Match genusShort = Regex.Match(genSp.Value, genusNPrefix + "[A-Z][a-z]*?(?=\\.)");
                Match species = Regex.Match(genSp.Value, "(?<=<tp:taxon-name-part taxon-name-part-type=\"species\">).*?(?=<)");
                Console.WriteLine("Shortened species found:\t{0}. {1}\n", genusShort.Value, species.Value);
                bool isFound = false;
                Console.WriteLine("Scanning containing paragraph to find suitable genus...");
                Match paragraph = Regex.Match(xml, "<p>.*?" + Regex.Escape(genSp.Value));
                if (paragraph.Success)
                {
                    Console.WriteLine("Paragraph content:\n\t{0}\n", paragraph.Value);
                    string lastGenusFound = "";
                    isFound = false;
                    Match genusPar = Regex.Match(paragraph.Value, genusNPrefix + Regex.Escape(genusShort.Value) + "[a-z]+?" + genusNSuffix);
                    while (genusPar.Success)
                    {
                        isFound = true;
                        lastGenusFound = genusPar.Value;
                        Console.WriteLine("........ Found Genus in paragraph: {0}\n", lastGenusFound);
                        genusPar = genusPar.NextMatch();
                    }
                    if (isFound)
                    {
                        Console.WriteLine("\n\tSpecies name '{0}. {1}' will be replaced by '{2} {1}' in the current paragraph.\n", genusShort.Value, species.Value, lastGenusFound);
                        string replace = Regex.Replace(paragraph.Value, ">" + genusPrefix + genusShort.Value + "\\." + genusSuffix, " unfold=\"true\"><tp:taxon-name-part taxon-name-part-type=\"genus\">" + lastGenusFound + "</tp:taxon-name-part>");
                        xml = Regex.Replace(xml, Regex.Escape(paragraph.Value), replace);
                    }
                    else
                    {
                        Console.WriteLine("\n\tNo suitable genus name has been found in the current paragraph.\n");
                    }
                }
                else
                {
                    Console.WriteLine("This species is not in a paragraph or is already unfolded");
                }
                Console.WriteLine("\n");
                genSp = genSp.NextMatch();
            }
        }
    }
}
