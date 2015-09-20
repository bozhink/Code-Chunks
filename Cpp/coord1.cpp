#include <iostream>
using namespace std;

class coord {
	int x,y;
public:
	coord() {x=0; y=0;}
	coord(int i, int j) { x=i; y=j; }
	friend ostream &operator<<(ostream &stream, coord ob);
	friend istream &operator>>(istream &stream, coord &ob);
};

ostream &operator<<(ostream &stream, coord ob) {
	stream << ob.x << ", " << ob.y << '\n';
	return stream;
}

istream &operator>>(istream &stream, coord &ob) {
	cout << "Enter coordinates: ";
	stream >> ob.x >> ob.y;
	return stream;
}

int main() {
	coord a(1,1), b(10,23);
	cout << a << b;
	cin >> a;
	cout << a;
	return 0;
}

