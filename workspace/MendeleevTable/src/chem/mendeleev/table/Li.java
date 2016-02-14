package chem.mendeleev.table;

public class Li extends Element
{
	public Li()
	{
		shortName = "Li";
		longName  = "";
		Z = 3;
		A = 6.941;
		periodNumber = 2;
		groupNumber = 1;
		groupType = 'A';
		elementType = 'p';
		electronStructure = new int[2];
		electronStructure[0] = 2;
		electronStructure[1] = 1;
	}
}
