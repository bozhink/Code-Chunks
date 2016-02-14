package chem.mendeleev.table;

abstract public class Element 
{
	public String shortName; // Chemical symbol
	public String longName;  // Human-read name
	public int Z;    // Atomic number
	public double A; // Mean atomic mass
	public int periodNumber;
	public int groupNumber;
	public char groupType; // 'A' or 'B'
	public char elementType; // 's', 'p', 'd' or 'f'
	public int[] electronStructure;
}
