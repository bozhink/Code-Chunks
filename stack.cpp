#include <iostream>
using namespace std;

#define SIZE 10

class stack
{
    char stck[SIZE];
    int tos;

  public:
    void init();
    void push(char ch);
    char pop();
};

void stack::init()
{
    tos = 0;
}

void stack::push(char ch)
{
    if (tos >= SIZE)
    {
        cout << "Stack is full" << endl;
        return;
    }

    stck[tos] = ch;
}