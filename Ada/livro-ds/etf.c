/* (C) 1999, Arthur Vargas Lopes */
/* Arquivo fonte ETF.c           */

#include "etf.h"

#define Token  char

char  Source[200]; /* Armazena uma express�o */
int   ISource;     /* �ndice do pr�ximo caractere */
Token Ultima;      /* Caractere look ahead */
int   LAhead;      /* Sinaliza look ahead ativo */

void Inicializa(char S[])
{
	strcpy(Source, S);
	ISource = 0;
	LAhead  = FALSE;

} /* Inicializa */

/* Obt�m um s�mbolo de Source */
Token Scanner()
{
	Token Tk;

	if (LAhead) { /* Retorna a token recebida por Back */
		Tk      = Ultima;
		LAhead  = FALSE;
		}
	else  {
		Tk      = Source[ISource];
		ISource = ISource + 1;
		/* Ignora brancos */
		while (Tk == ' ') {
			Tk      = Source[ISource];
			ISource = ISource + 1;
			}
		}

	return Tk;

} /* Scanner */

/* Salva Tk no buffer de look ahead */
void Back(Token Tk) 
{
	LAhead = TRUE;
	Ultima = Tk;

} /* Back */

/* Obt�m um fator */
int F()
{
	Token Tk;
	int   R;

	Tk = Scanner();

	if (Tk == '(') { /* Processa ( E ) */

		R = E();

		Tk = Scanner();

		if (Tk != ')') {
			printf("Expressao invalida ==> %c\n", Tk);
			exit(1);
			}
		}
	else if (!isdigit(Tk)) {
		printf("Expressao invalida ==> %c\n", Tk);
		exit(1);
		}
	else	/* Converte um d�gito para seu valor decimal */
		R = Tk - '0';

	return R;

} /* F */ 

/* Obt�m um termo */
int T()
{
	Token Tk;
	int   Op1;
	int   Op2;

	Op1 = F();

	Tk = Scanner();

	while ((Tk == '*') || (Tk == '/')) {

		Op2 = F();

		/* Avalia a sub-express�o */
		if (Tk == '*')
			Op1 = Op1 * Op2;
		else  /* Testar divis�o por zero */
			Op1 = Op1 / Op2;

		Tk = Scanner();
		}

	Back(Tk);

	return Op1;

} /* T */

/* Obt�m uma express�o */
int E()
{
	Token Tk;
	int   Op1;
	int   Op2;

	Op1 = T();

	Tk = Scanner();

	while ((Tk == '+') || (Tk == '-')) {

		Op2 = T();

		/* Avalia a sub-express�o */
		if (Tk == '+')
			Op1 = Op1 + Op2;
		else
			Op1 = Op1 - Op2;

		Tk = Scanner();
		}

	Back(Tk);

	return Op1;

} /* E */
