#include <vector>
using namespace std;
 
void countingSort(vector<int>& Array)
{
	int Min, Max;
	Min = Max  = Array[0];
	for(int i = 1; i < Array.size(); i ++) //determine the max and min in the array
	{
		if(Array[i] < Min)
			Min = Array[i];
 
		if(Array[i] > Max)
			Max = Array[i];
	}
	int Range = Max - Min + 1; //the range is useful to minimize the memory usage
 
	vector<int> Count(Range,0); //Count Array Hold The Number Of Each Number
 
	for(int i = 0; i < Array.size(); i ++)
		Count[Array[i] - Min] ++;
 
	int Index = 0;
	for(int i = Min; i <= Max; i ++) //Fill Array in sorted Order
		for(int j = 0; j < Count[i - Min]; j ++)
			Array[Index ++] = i;
}
