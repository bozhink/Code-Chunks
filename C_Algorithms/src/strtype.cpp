#include <iostream>
#include <cstring>
#include <cstdlib>
#include <cstdio>
using namespace std;
#define SIZE 255000000

class strtype {
    char *p;
    int len;
public:
    strtype();
    ~strtype();
    void set(char*ptr);
    void show();
};

strtype::strtype()
{
    p = (char*) malloc(SIZE);
    if (!p) {
        cout << "Allocation error\n";
        exit(1);
    }
    *p = '\0';
    len = 0;
}

strtype::~strtype()
{
    cout << "Freeing p\n";
    free(p);
}

void strtype::set(char *ptr)
{
    if (strlen(p) >= SIZE) {
        cout << "String too bin\n";
        return;
    }
    strcpy(p, ptr);
    len = strlen(p);
}

void strtype::show()
{
    cout << p << " - length: " << len;
    cout << "\n";
}

void exec()
{
    char c;
    strtype s1, s2;
    s1.set("This is a test.");
    s2.set("Hello, World!");

    s1.show();
    s2.show();
    c=getchar();
}

int main()
{
    char c;
    exec();
    c=getchar();
    cout << "After freing?\n";

    exec();

    return 0;
}

