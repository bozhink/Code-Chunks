package chem.mendeleev.table;

public class C extends Element
{
	public C()
	{
		shortName = "C";
		longName  = "";
		Z = 6;
		A = 12.01115;
		periodNumber = 2;
		groupNumber = 4;
		groupType = 'A';
		elementType = 'p';
		electronStructure = new int[2];
		electronStructure[0] = 2;
		electronStructure[1] = 4;
	}
}
