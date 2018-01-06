using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace PenTagger
{
	class Species
	{
		public static Regex GenusName = new Regex("(?<=<tp:taxon-name-part taxon-name-part-type=\"genus\">)[A-Z][a-z\\.]+(?=</tp:taxon-name-part>)");
		public static Regex SubgenusName = new Regex("(?<=<tp:taxon-name-part taxon-name-part-type=\"subgenus\">)[A-Z][a-z\\.]+(?=</tp:taxon-name-part>)");
		public static Regex SpeciesName = new Regex("(?<=<tp:taxon-name-part taxon-name-part-type=\"species\">)[a-z\\-\\.]+(?=</tp:taxon-name-part>)");
		public static Regex SubspeciesName = new Regex("(?<=<tp:taxon-name-part taxon-name-part-type=\"subspecies\">)[a-z\\-]+(?=</tp:taxon-name-part>)");

/*
		public readonly string genus;
		public readonly string subgenus;
		public readonly string species;
		public readonly string subspecies;
		public readonly bool isGenusNull;
		public readonly bool isSubgenusNull;
		public readonly bool isSpeciesNull;
		public readonly bool isSubspeciesNull;
		public readonly bool isShortened;
*/
		public  string genus;
		public  string subgenus;
		public  string species;
		public  string subspecies;
		public  bool isGenusNull;
		public  bool isSubgenusNull;
		public  bool isSpeciesNull;
		public  bool isSubspeciesNull;
		public  bool isShortened;

		public Species (string parsedContent)
		{
			Match m = Species.GenusName.Match(parsedContent);
			genus = m.Success ? m.Value : "";
			m = Species.SubgenusName.Match(parsedContent);
			subgenus = m.Success ? m.Value : "";
			m = Species.SpeciesName.Match(parsedContent);
			species = m.Success ? m.Value : "";
			m = Species.SubspeciesName.Match(parsedContent);
			subspecies = m.Success ? m.Value : "";
			isGenusNull = IsGenusNull();
			isSubgenusNull = IsSubgenusNull();
			isSpeciesNull = IsSpeciesNull();
			isSubspeciesNull = IsSubspeciesNull();
			isShortened = IsShortened();
		}

		public Species (string genus, string subgenus, string species, string subspecies)
		{
			this.genus = genus;
			this.subgenus = subgenus;
			this.species = species;
			this.subspecies = subspecies;
			isGenusNull = IsGenusNull();
			isSubgenusNull = IsSubgenusNull();
			isSpeciesNull = IsSpeciesNull();
			isSubspeciesNull = IsSubspeciesNull();
			isShortened = IsShortened();
		}

		public Species ()
		{
			genus = "";
			subgenus = "";
			species = "";
			subspecies = "";
			isGenusNull = true;
			isSubgenusNull = true;
			isSpeciesNull = true;
			isSubspeciesNull = true;
			isShortened = false;
		}

		public Species (Species sp)
		{
			this.genus = sp.genus;
			this.subgenus = sp.subgenus;
			this.species = sp.species;
			this.subspecies = sp.subspecies;
			isGenusNull = IsGenusNull();
			isSubgenusNull = IsSubgenusNull();
			isSpeciesNull = IsSpeciesNull();
			isSubspeciesNull = IsSubspeciesNull();
			isShortened = IsShortened();
		}

		public void SetGenus (string genus)
		{
			this.genus = genus;
			isGenusNull = IsGenusNull();
			isShortened = IsShortened();
		}

		public void SetSubgenus (string subgenus)
		{
			this.subgenus = subgenus;
			isSubgenusNull = IsSubgenusNull();
			isShortened = IsShortened();
		}

		public void SetSpecies (string species)
		{
			this.species = species;
			isSpeciesNull = IsSpeciesNull();
			isShortened = IsShortened();
		}

		public void SetSubspecies (string subspecies)
		{
			this.subspecies = subspecies;
			isSubspeciesNull = IsSubspeciesNull();
		}

		public void SetGenus (Species sp)
		{
			this.genus = sp.genus;
			isGenusNull = sp.isGenusNull;
			isShortened = IsShortened();
		}

		public void SetSubgenus (Species sp)
		{
			this.subgenus = sp.subgenus;
			isSubgenusNull = sp.isSubgenusNull;
			isShortened = IsShortened();
		}

		public void SetSpecies (Species sp)
		{
			this.species = sp.species;
			isSpeciesNull = sp.isSpeciesNull;
			isShortened = IsShortened();
		}

		public void SetSubspecies (Species sp)
		{
			this.subspecies = sp.subspecies;
			isSubspeciesNull = sp.isSubspeciesNull;
		}
		
		private bool IsGenusNull()
		{
			if (genus.Length==0) {
				return true;
			} else {
				return false;
			}
		}

		private bool IsSubgenusNull()
		{
			if (subgenus.Length==0) {
				return true;
			} else {
				return false;
			}
		}

		private bool IsSpeciesNull()
		{
			if (species.Length==0) {
				return true;
			} else {
				return false;
			}
		}

		private bool IsSubspeciesNull()
		{
			if (subspecies.Length==0) {
				return true;
			} else {
				return false;
			}
		}
		
		private bool IsShortened() {
			string sp = genus + subgenus + species + subspecies;
			if (sp.IndexOf('.')>-1) {
				return true;
			} else {
				return false;
			}
		}

		public string AsString()
		{
			string result = "";
			if (!isGenusNull) result += genus;
			if (!isSubgenusNull) {
				if (result.Length != 0) result += " ";
				result += "(" + subgenus + ")";
			}
			if (!isSpeciesNull) {
				if (result.Length != 0) result += " ";
				result += species;
			}
			if (!isSubgenusNull) {
				if (result.Length != 0) result += " ";
				result += subspecies;
			}
			return result;
		}
	}
}