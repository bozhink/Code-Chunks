#include <iostream>
using namespace std;

#define SIZE 10

class stack {
    char stck[SIZE];
    int tos;
public:
    stack();
    void init();
    void push(char ch);
    char pop();
};

stack::stack() {
    init();
}

void stack::init() {
    tos = 0;
}

void stack::push(char ch) {
    if (SIZE <= tos) {
        cout << "Stack is full" << endl;
    }

    stck[tos] = ch;
    tos++;
}

char stack::pop() {
    if (tos <= 0) {
        cout << "Stack is empty" << endl;
        return 0;
    }

    tos--;
    return stck[tos];
}

int main() {
    stack s1, s2;

    s1.push('a');
    s2.push('x');
    s1.push('b');
    s2.push('y');
    s1.push('c');
    s2.push('z');

    for (int i = 0; i < SIZE; i++) {
        cout << s1.pop() << endl;
    }

    for (int i = 0; i < SIZE; i++) {
        cout << s2.pop() << endl;
    }

    return 0;
}
