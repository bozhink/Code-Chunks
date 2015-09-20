/*
 * triangle.cpp
 *
 *  Created on: 17.08.2011
 *      Author: Owner
 */

#include <iostream>
using namespace std;

class triangle {
	int height, base;
public:
	triangle(int h, int b){height=h; base=b;}
	friend ostream &operator<<(ostream &stream, triangle ob);
};

ostream &operator<<(ostream &stream, triangle ob)
{
	int i,j,h,k;

	i=j=ob.base-1;
	for (h=ob.height-1; h; h--)
	{
		for (k=i; k; k--)
			stream << ' ';
		stream << '*';
		if(j!=i)
		{
			for (k=j-i-1;k;k--)
				stream << ' ';
			stream <<'*';
		}

		i--;
		stream << '\n';
	}
	for (k=0; k<ob.base; k++) stream << '+';
	stream << '\n';
	return stream;
}

int main()
{
	triangle t1(5,5), t2(10,10), t3(12,12);
	cout << t1;
	cout << endl << t2 << endl << t3;
	return 0;
}


