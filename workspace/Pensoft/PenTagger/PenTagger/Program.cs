using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace PenTagger
{
	class PenTagger
	{
		private const string Charset = "utf-8";

		static void Main (string[] args)
		{
			if (args.Length < 3) {
				PenTagger.PrintHelp ();
				return;
			}
			int tic, toc;
			int tinit = gettime();

			string InputFileName = args [1];
			string OutputFileName = args [2];
			bool tagWWW = false;
			bool tagDOI = false;
			bool tagFigTab = false;
			bool tagCoords = false;
			bool formatInit = false;
			bool formatTreat = false;
			bool crossRef = false;
			bool unstableExpand1 = false;
			bool unstableExpand2 = false;
			bool unstableExpand3 = false;
			bool unstableExpand4 = false;
			bool unstableExpand5 = false;
			bool unstableExpand6 = false;
			bool unstableExpand7 = false;
			bool unstableExpand8 = false;
			bool tex = false;
			bool nlm = false;
			bool html = false;

			char [] args0 = args [0].ToCharArray ();
			if (args0 [0] == '-' && args [0].ToString ().Length > 1) {
				for (int i = 1; i < args[0].ToString().Length; i++) {
					if (args0 [i] == 'i')
						formatInit = true;
					if (args0 [i] == 't')
						formatTreat = true;
					if (args0 [i] == 'w')
						tagWWW = true;
					if (args0 [i] == 'd')
						tagDOI = true;
					if (args0 [i] == 'f')
						tagFigTab = true;
					if (args0 [i] == 'c')
						tagCoords = true;
					if (args0 [i] == '1')
						unstableExpand1 = true;
					if (args0 [i] == '2')
						unstableExpand2 = true;
					if (args0 [i] == '3')
						unstableExpand3 = true;
					if (args0 [i] == '4')
						unstableExpand4 = true;
					if (args0 [i] == '5')
						unstableExpand5 = true;
					if (args0 [i] == '6')
						unstableExpand6 = true;
					if (args0 [i] == '7')
						unstableExpand7 = true;
					if (args0 [i] == '8')
						unstableExpand8 = true;
					if (args0 [i] == 'h') {
						PenTagger.PrintHelp ();
						return;
					}
					if (args0 [i] == 'r')
						crossRef = true;
					if (args0 [i] == 'T')
						tex = true;
					if (args0 [i] == 'N')
						nlm = true;
					if (args0 [i] == 'H')
						html = true;
				}
			}

			if (!crossRef && !tex && !nlm && !html) {
				int numberOfFigures = 0;
				if (args.Length >= 4)
					numberOfFigures = int.Parse (args [3]);
				XMLProcessor fp;
				if (numberOfFigures > 0) {
					fp = new XMLProcessor (InputFileName, OutputFileName, numberOfFigures);
				} else {
					fp = new XMLProcessor (InputFileName, OutputFileName);
				}
				fp.GetContent ();

				if (formatInit) {
					tic = gettime();
					Console.WriteLine ("Initial format...");
					fp.InitialFormat ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}
				//
				// Performs Tagging
				//
				if (tagWWW) {
					tic = gettime();
					Console.WriteLine ("Tagging web links...");
					fp.TagWWW ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}
				if (tagDOI) {
					tic = gettime();
					Console.WriteLine ("Tagging DOI...");
					fp.TagDOI ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}
				if (tagFigTab) {
					tic = gettime();
					Console.WriteLine ("Tagging figures and tables...");
					fp.GetFigures ();
					fp.TagFiguresAndTables ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}
				if (tagCoords) {
					tic = gettime();
					Console.WriteLine ("Tagging coordinates...");
					fp.TagCoordinates ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}

				if (formatInit) {
					tic = gettime();
					Console.WriteLine ("Formating titles and labels...");
					fp.TitleLabel ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}
				if (formatTreat) {
					tic = gettime();
					Console.WriteLine ("Formatting treatements and tagging taxons...");
					fp.FormatTreatments ();
					fp.TagLowerTaxa ();
					fp.TagHigherTaxa ();
					fp.UntagTaxa ();

					Console.WriteLine ("Expanding shortened genera with StableExpand[ and UnstableExpand 1, 2, 3]...");
					fp.SplitLowerTaxa ();
					fp.StableExpand ();
					if (unstableExpand1)
						fp.UnstableExpand1 ();
					if (unstableExpand2)
						fp.UnstableExpand2 ();
					if (unstableExpand3)
						fp.UnstableExpand3 ();
					fp.UnSplitTaxa ();

					fp.SplitLowerTaxa ();
					fp.StableExpand ();
					if (unstableExpand1)
						fp.UnstableExpand1 ();
					if (unstableExpand2)
						fp.UnstableExpand2 ();
					if (unstableExpand3)
						fp.UnstableExpand3 ();
					fp.UnSplitTaxa ();

					toc = gettime();

					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}
				
				tic = gettime();
				Console.WriteLine("Unstable expand optional:");
				if (unstableExpand4) {
					fp.SplitLowerTaxa ();
					fp.UnstableExpand4 ();
					fp.UnSplitTaxa ();
				}
				if (unstableExpand5) {
					fp.SplitLowerTaxa ();
					fp.UnstableExpand5 ();
					fp.UnSplitTaxa ();
				}
				if (unstableExpand6) {
					fp.SplitLowerTaxa ();
					fp.UnstableExpand6 ();
					fp.UnSplitTaxa ();
				}
				if (unstableExpand7) {
					fp.SplitLowerTaxa ();
					fp.UnstableExpand7 ();
					fp.UnSplitTaxa ();
				}
				if (unstableExpand8) {
					fp.SplitLowerTaxa ();
					fp.UnstableExpand8 ();
					fp.UnSplitTaxa ();
				}
				toc = gettime();
				Console.WriteLine("Completed in {0} ms.", toc-tic);
				
				tic = gettime();
				if (formatTreat) {
					fp.SubgenusBrackets();
				}
				if (formatInit) {
					Console.WriteLine ("Final format...");
					fp.FinalFormat ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}

				tic = gettime();
				Console.WriteLine ("Writing data to output file...");
				fp.WriteXMLFile ();
				toc = gettime();
				Console.WriteLine ("Completed in {0} ms.", toc-tic);
			} else {
				if (crossRef)
				{
					tic = gettime();
					CrossRef fp = new CrossRef (InputFileName, OutputFileName);
					fp.GetContent();
					Console.WriteLine ("Renumeration of CrossRef citations...");
					fp.Renumeration ();
					fp.WriteXMLFile ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}
				if (tex)
				{
					tic = gettime();
					TeX fp = new TeX (InputFileName, OutputFileName);
					fp.GetContent();
					Console.WriteLine ("Convertion to TeX...");
					fp.XMLtoTeX ();
					fp.WriteXMLFile ();
					toc = gettime();
					Console.WriteLine ("Completed in {0} ms.", toc-tic);
				}
				if (nlm)
				{
					tic = gettime();
					NLM fp = new NLM (InputFileName, OutputFileName);
					fp.GetContent();
					Console.WriteLine("Formating NLM XML file...");
					fp.Format();
					fp.WriteXMLFile ();
					toc = gettime();
					Console.WriteLine("Completed in {0} ms.", toc-tic);
				}
				if (html)
				{
					tic = gettime();
					HTML fp = new HTML (InputFileName, OutputFileName);
					fp.GetContent();
					Console.WriteLine("Formating HTML file...");
					fp.Format();
					fp.WriteXMLFile ();
					toc = gettime();
					Console.WriteLine("Completed in {0} ms.", toc-tic);
				}
			}
			int tfinal = gettime() ;
			int tsum = tfinal - tinit;
			Console.WriteLine("Program executed in {0} ms = {1} s = {2} m", tsum, tsum/1000.0, tsum/60000.0); 
		}

		public static void PrintHelp()
		{
			Console.WriteLine("Usage: PenTagger -<options> <input file name> <output file name> [<number of figures>]");
			Console.WriteLine("where:\nOptions:");
			Console.WriteLine("\ti = perform initial format");
			Console.WriteLine("\tt = format treatements");
			Console.WriteLine("\tw = tag links");
			Console.WriteLine("\td = tag DOI");
			Console.WriteLine("\tf = tag figures and tables");
			Console.WriteLine("\tc = tag coordinates");
			Console.WriteLine("\t1,2,3,4,5,6,7,8 = unstable expand level");
			Console.WriteLine("\th = print this message and exit");
			Console.WriteLine("\tr = renumerate cross-ref citations");
			Console.WriteLine("\tT = convert XML to TeX");
			Console.WriteLine("\tN = convert XML to NLM XML");
			Console.WriteLine("\tH = initial format of HTML file");
		}

		public static int gettime() {
			DateTime t = DateTime.Now;
			return t.Millisecond + 1000 * (t.Second + 60 * (t.Minute + 60 * t.Hour));
		}
	}
}
