#include <iostream>
using namespace std;

class array
{
	int nums[10];
public:
	array();
	void set(int n[10]);
	void show();
	friend array operator+(array ob1, array ob2);
	friend array operator-(array ob1, array ob2);
	friend int operator==(array ob1, array ob2);
};

array::array()
{
	for(int i=0; i<10; i++) nums[i] = 0;
}

void array::set(int *n)
{
	for (int i=0; i<10; i++) nums[i] = n[i];
}

void array::show()
{
	for (int i=0; i<10; i++) cout << nums[i] << ' ';
	cout << '\n';
}

array operator+(array ob1, array ob2)
{
	int i;
	array temp;
	for (i=0; i<10; i++) temp.nums[i] = ob1.nums[i] + ob2.nums[i];
	return temp;
}

array operator-(array ob1, array ob2)
{
	int i;
	array temp;
	for (i=0; i<10; i++) temp.nums[i] = ob1.nums[i] - ob2.nums[i];
	return temp;
}

int operator==(array ob1, array ob2)
{
	for (int i=0; i<10; i++) if (ob1.nums[i]!=ob2.nums[i]) return 0;
	return 1;
}

int main()
{
	array o1, o2, o3;
	int i[10] = {1,2,3,4,5,6,7,8,9,10};
	
	o1.set(i);
	o2.set(i);
	
	o3 = o1+o2;
	o3.show();
	
	o3 = o1-o2;
	o3.show();
	
	if(o1==o2) cout << "o1 equals o2\n";
	else cout << "o1 does not equal o2\n";
	
	if (o1==o3) cout << "o1 equals o3\n";
	else cout << "o1 does not equal o3\n";
	
	return 0;
}

