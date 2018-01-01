// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte APosfix2.h 
#ifndef AVALIA_POSFIX
#define AVALIA_POSFIX

#include <iostream.h>
#include <malloc.h>
#include <process.h>
#include <string.h> 
#include <ctype.h>                            


// Tipo define o tipo de valor armazenado na pilha 
// Max define o número máximo de elementos da pilha 
template <class Tipo,int Max> class APosfix
{
public:

	void Inicializa();
	void Push(Tipo D);
	void Pop(Tipo *R);
	void Avalia_Posfix(char E[], Tipo *R);

private:    
	
	Tipo V[Max];
	int Sp;
};


template <class Tipo,int Max>
void APosfix<Tipo,Max>::Inicializa()
{
	Sp = -1;
}; // Inicializa 

// Implementação do algoritmo 3.2 
template <class Tipo,int Max>
void APosfix<Tipo,Max>::Push(Tipo D)
{
	if (Sp ==  (Max - 1)) { // Verifica overflow de pilha 
		cout << "*** Overflow na pilha ***\n";
		exit(1);
		}
	else {
		Sp += 1;
		V[Sp] = D;
		}
}; // Push 

// Implementação do algoritmo 3.3 
template <class Tipo,int Max>
void APosfix<Tipo,Max>::Pop(Tipo *R)
{
	if (Sp < 0) {  // Verifica underflow de pilha 
		cout << "*** Underflow na pilha ***\n";
		exit(1);
		}
	else  
		*R = V[Sp--];
}; // Pop 
 
// Implementação do algoritmo 3.4 
template <class Tipo,int Max>
void APosfix<Tipo,Max>::Avalia_Posfix(char E[], Tipo *R)
{
	int   I;	            // Auxilia no loop 
	Tipo  Op1;
	Tipo  Op2;

	Inicializa();
	for(I = 0; I < strlen(E); ++I) 
		if (isdigit(E[I]))
				Push(E[I] - '0');
		else {
			Pop(&Op1);
			Pop(&Op2);
			switch (E[I]) {
				case '+' : 
						Push(Op1 + Op2);
						break;
				case '-' : 
						Push(Op1 - Op2);
						break;
				case '*' : 
						Push(Op1 * Op2);
						break;
				case '/' : 
						Push(Op1 / Op2);
						break;
				}
			}
		Pop(R);
}; // Avalia_Posfix 

#endif
