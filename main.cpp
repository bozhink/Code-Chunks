#include <iostream>
using namespace std;

class samp {
    int i, j;
public:
    samp(int a, int b);
    int divisible();
};

samp::samp(int a, int b) {
    i = a;
    j = b;
}

inline int samp::divisible() {
    return !(i % j);
}

inline int even(int x) {
    return !(x % 2);
}

inline int min(int a, int b) {
    return a < b ? a : b;
}

inline long min(long a, long b) {
    return a < b ? a : b;
}

inline float min(float a, float b) {
    return a < b ? a : b;
}

inline double min(double a, double b) {
    return a < b ? a : b;
}

int main(int argc, char **argv) {

    union {
        unsigned char bytes[8];
        double value;
    };

    value = 859345.324;

    for (int i = 0; i < 8; i++) {
        cout << (int)bytes[i] << " ";
    }

    cout << endl;

    cout << value << endl;

    bytes[1] = 0;

    cout << value << endl;

    samp o1(10, 2), o2(10, 3);

    cout << o1.divisible() << endl;
    cout << o2.divisible() << endl;

    return 0;
}

