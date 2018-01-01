// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte ETF.cpp

#include "etf2.h"

Etf::Etf(char *S) // Construtor -- Inicializa
{ 
	strcpy(Source,S); 
	ISource = 0;
	LAhead  = FALSE;
}

// Obt�m um s�mbolo de Source 
Token Etf::Scanner()
{
	Token Tk;

	if (LAhead) { // Retorna a token recebida por Back 
		Tk      = Ultima;
		LAhead  = FALSE;
		}
	else {
		Tk      = Source[ISource];
		ISource = ISource + 1;
		// Ignora brancos 
		while (Tk == ' ') {
			Tk      = Source[ISource];
			ISource = ISource + 1;
			}
		}

	return Tk;

} // Scanner 

// Salva Tk no buffer de look ahead 
void Etf::Back(Token Tk) 
{
	LAhead = TRUE;
	Ultima = Tk;

} // Back 

// Obt�m um fator 
int Etf::F()
{
	Token Tk;
	int   R;

	Tk = Scanner();

	if (Tk == '(') { // Processa ( E ) 

		R = E();

		Tk = Scanner();

		if (Tk != ')') {
			cout << "Expressao invalida ==> " << Tk << '\n';
			exit(1);
			}
		}
	else if (!isdigit(Tk)) {
		cout << "Expressao invalida ==> " << Tk << '\n';
		exit(1);
		}
	else	// Converte um d�gito para seu valor decimal 
		R = Tk - '0';

	return R;

} // F  

// Obt�m um termo 
int Etf::T()
{
	Token Tk;
	int   Op1;
	int   Op2;

	Op1 = F();

	Tk = Scanner();

	while ((Tk == '*') || (Tk == '/')) {

		Op2 = F();

		// Avalia a sub-express�o 
		if (Tk == '*')
			Op1 = Op1 * Op2;
		else  // Testar divis�o por zero 
			Op1 = Op1 / Op2;

		Tk = Scanner();
		}

	Back(Tk);

	return Op1;

} // T 

// Obt�m uma express�o 
int Etf::E()
{
	Token Tk;
	int   Op1;
	int   Op2;

	Op1 = T();

	Tk = Scanner();

	while ((Tk == '+') || (Tk == '-')) {

		Op2 = T();

		// Avalia a sub-express�o 
		if (Tk == '+')
			Op1 = Op1 + Op2;
		else
			Op1 = Op1 - Op2;

		Tk = Scanner();
		}

	Back(Tk);

	return Op1;

} // E 
