package chem.mendeleev.table;

public class N extends Element
{
	public N()
	{
		shortName = "N";
		longName  = "";
		Z = 7;
		A = 14.01015;
		periodNumber = 2;
		groupNumber = 5;
		groupType = 'A';
		elementType = 'p';
		electronStructure = new int[2];
		electronStructure[0] = 2;
		electronStructure[1] = 5;
	}
}
