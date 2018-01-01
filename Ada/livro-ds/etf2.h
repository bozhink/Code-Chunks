// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte ETF2.h           

#ifndef ETF
#define ETF

#include <iostream.h>
#include <process.h>
#include <string.h>
#include <ctype.h>

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

#define Token  char

class Etf
{
public:
	Etf(char *S);
	
	int E();
private:
	Token Scanner();
	void Back(Token Tk);
	int F();
	int T();

	char  Source[200]; // Armazena uma expressão 
	int   ISource;     // Índice do próximo caractere 
	Token Ultima;      // Caractere look ahead 
	int   LAhead;      // Sinaliza look ahead ativo 
};

#endif