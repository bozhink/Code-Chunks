/* (C) 1996-1998, Arthur Vargas Lopes */
/* Arquivo fonte Iorand.c             */

#include "iorand.h"
#include <string.h>
#include <time.h>

#define P(n,r)        ((1L * (r)) * n + sizeof(IORSIZE))
#define PB(n,r)       ((1L * (r+1L)) * n + sizeof(IORSIZE) + r)
#define PBB(n,r)       ((1L * (r+1L)) * n + sizeof(IORSIZE))

/* Registra erro de I/O no arquivo "iorand.$tr" */
void ior_trace(char *s1, char *s2)
{
	FILE *fp;
	struct tm *newtime;
	time_t aclock;
	char t[100];
	
	time(&aclock);
	newtime = localtime(&aclock);
	strcpy(t,asctime(newtime));
	t[strlen(t)-1] = '\0';
	
	fp = fopen("iorand.$tr","a+");
	fprintf(fp,"%s ior_trace: %s %s\n", t, s1, s2);
	fclose(fp);
}


/* Retorna 1 se o registro n está em uso caso contrário retorna 0 */
int ior_testa(IORPTR x,long n)
{
	long k;
	char c;     
	long i, j;                 

	if (n < 0 || n >= (IOR_MAX - 1)) return(0);
	if (n >= IOR_MAX)      {
		k = fseek(x -> iorfp, 0L, 2);
		if (k <= PB(n,x -> iorsize)) return(0);
		k = fseek(x -> iorfp, PB(n,x -> iorsize), 0);
		if (fread( &c,1,1,x -> iorfp) != 1) return(0);
		if (c != 'I') return(0);
		return(1);
		}
	i = IOR_POS(n);
	j = IOR_BIT(n);
	return((x -> iordir[i]) & (1 << j));
}


/* Retorna o primeiro registro livre */
long ior_first(IORPTR x)
{
	long i, j;
	long kk;
	char c;

	for(i = 0; i < IOR_LEN; ++i)
		for(j = 0; j < IOR_W; ++j)
			if (!((x -> iordir[i]) & (1 << j)))
				return(IOR_W * i + j);
	kk = fseek(x -> iorfp, 0L, 2);
	for(i = IOR_MAX; i < (IOR_MAX - 1); ++i)    {
		if (fseek(x -> iorfp, PB(i,x->iorsize), 0) != PB(i,x->iorsize))
			return(-1);
		if (kk > PB(i,x->iorsize))  {
			if (fread(&c,1,1,x -> iorfp) != 1) return(-1);
			if (c == 'D') return(i);
			}
		else  {
			c = 'D';
			fwrite(&c,1,1,x -> iorfp);
			return(i);
			}
		}
	return(-1);
}


/* Retorna o próximo registro em uso a partir de k */
long ior_next(IORPTR x,	long k)
{
	long i;
	long kk;

	if (k < -1 || k >= (IOR_MAX - 1)) return(-1);
	for(i = k + 1; i < IOR_MAX; ++i)  
		if (ior_testa(x,i)) return(i);
	kk = fseek(x -> iorfp, 0L, 2);
	for( ; kk > PB(i,x -> iorsize); ++i)  
		if (ior_testa(x,i)) return(i);
	return(-1);
}


/* Marca o registro n como em uso */
void ior_liga(IORPTR x,long n)
{
	if (n >= IOR_MAX)   {
		fseek(x -> iorfp, PB(n, x -> iorsize), 0);
		fwrite("I",1,1,x->iorfp);
		}
	else  {
		x -> iordir[IOR_POS(n)] |= (1 << IOR_BIT(n));
		fseek(x -> iorfp, (long) (IOR_POS(n)*1L), 0);
		fwrite(&(x -> iordir[IOR_POS(n)]),1,1,x->iorfp);
		}
	fflush(x -> iorfp);
}


/* Marca o registro n como livre */
void ior_desliga(IORPTR x,long n)
{
	if (n >= IOR_MAX)   {
		fseek(x -> iorfp, PB(n, x -> iorsize), 0);
		fwrite("D",1,1,x->iorfp);
		}
	else  {
		x -> iordir[IOR_POS(n)] &= (~(1 << IOR_BIT(n)));
		fseek(x -> iorfp, (long) (IOR_POS(n)*1L), 0);
		fwrite(&(x -> iordir[IOR_POS(n)]),1,1,x->iorfp);
		}
	fflush(x -> iorfp);
}
 

/* Fecha o arquivo x */
void ior_close(IORPTR x)
{       
	char msg[256];
	
	fseek(x -> iorfp, 0L, 0);
	if (fwrite(x,sizeof(IORSIZE),1,x -> iorfp) != 1)  {
		sprintf(msg,"Nao pode gravar header %s\n", x -> iorfn);
		ior_trace(msg,"ior_close");
		}
	fclose(x -> iorfp);
	free(x);
}


/* Abre o arquivo fn com buffer localizado em i contendo
   s bytes por registro */
IORPTR ior_open(char *fn,char *i,int s)
{
	IORPTR w;
	FILE *f;     
	char msg[256];
	
	if ((w = (IORPTR) calloc(1,sizeof(IORSIZE))) <= 0L)  {
		sprintf(msg,"Faltou memoria para alocar header de %s\n",fn);
		ior_trace(msg,"ior_open");
		return NULL;
		}
	if ((f = fopen(fn,"rb+"))  == NULL) 
		return(NULL);
	if (fread(w,sizeof(IORSIZE),1,f) != 1)  {
		sprintf(msg,"Nao pode ler header de %s\n",fn);
		ior_trace(msg,"ior_open");
		return NULL;
		}
	w -> iorfp   = f;
	w -> iori    = i;
	w -> iorsize = s;
	return(w);
}
                                   
                                   
/* Cria o arquivo fn com buffer localizado em in contendo
   s bytes por registro */
IORPTR ior_init(char *fn,char *in,int s)
{
	IORPTR w;
	long i;                         
	char msg[256];
	
	if ((w = (IORPTR) calloc(1,sizeof(IORSIZE))) <= 0L)  {
		sprintf(msg,"Faltou memoria para alocar header de %s\n",fn);
		ior_trace(msg,"ior_init");
		return NULL;
		}
	if ((w -> iorfp = fopen(fn,"wb+")) == NULL) 
		return NULL;
	strcpy(w -> iorfn, fn);
	w -> iorword = w -> iorbit = 0;
	w -> iorsize = s;
	w -> iori    = in;
	w -> iorpass[0] = '\0';
	for(i = 0; i < IOR_LEN; ++i)
		w -> iordir[i] = 0;
	if (fwrite(w,sizeof(IORSIZE),1,w -> iorfp) != 1)  {
		sprintf(msg,"Nao pode gravar header de %s\n",fn);
		ior_trace(msg,"ior_init");
		return NULL;
		}
	fclose(w -> iorfp);
	if ((w -> iorfp = fopen(fn,"rb+")) == NULL) {
		sprintf(msg,"Nao pode abrir arquivo %s\n",fn);
		ior_trace(msg,"ior_init");
		return NULL;
		}
	return(w);
}


/* Grava em disco o registro número n */
int ior_write(IORPTR x,long n)
{
	int nbytes;
	char msg[256];

	if (n >=IOR_MAX)   {
		fseek(x -> iorfp, (long) PBB(n,x->iorsize), 0);
		if ((nbytes = fwrite(x -> iori, x -> iorsize,1,x -> iorfp)) != 1)   {
			sprintf(msg,"Erro na gravacao do arquivo %s[%d]\n",x -> iorfn,nbytes);
			ior_trace(msg,"ior_write");
			return 1;
			}
		fwrite("I",1,1,x -> iorfp); 
		fflush(x -> iorfp);
		}
	else   {
		fseek(x -> iorfp, (long) P(n,x->iorsize), 0);
		if (fwrite(x -> iori, x -> iorsize,1,x -> iorfp) != 1)   {
			sprintf(msg,"Erro na gravacao do arquivo %s pos %d\n",x -> iorfn,n);
			ior_trace(msg,"ior_write");
			return 1;
			}
		ior_liga(x,n);
		}
	return 0;
}
            
            
/* Le de disco o registro de número n */
int ior_read(IORPTR x,long n)
{           
	char msg[256];
	
	if (n >= IOR_MAX)   {
		fseek(x -> iorfp, (long) PBB(n,x->iorsize), 0);
		if (fread(x -> iori, x -> iorsize,1,x -> iorfp) != 1)   {
			sprintf(msg,"Erro na leitura do arquivo %s pos %d\n",x -> iorfn,n);
			ior_trace(msg,"ior_read");
			return 1;
			}
		}
	else {		
		fseek(x -> iorfp, (long) P(n,x->iorsize), 0);
		if (fread(x -> iori, x -> iorsize,1,x -> iorfp) != 1)   {
			sprintf(msg,"Erro na leitura do arquivo %s pos %d\n",x -> iorfn,n);
			ior_trace(msg,"ior_read");
			return 1;
			}
		}
	return 0;
}



void main()
{
	__int64 a;

	a = 2543;


	printf("%I64d\n", a);
	printf("%I64d,%2I64d\n", a / 100, (a % 100));
	printf("sizeof(__int64) = %d\n", sizeof(__int64));
	for(a = 1; a >= 0; a *= 2)

		printf("%I64d\n", a);
}


/*
typedef struct {
	char b;
	int a;
	float val;
	char d[15];
	}  *DPTR, DATASIZE;

void main()
{
	IORPTR f;
	DATASIZE r;
	int i, j, k;
	char buf[100];

	r.b = EOF;
	r.a = 0.0;

	strcpy(r.d,"12345678901234");
	puts("\nCreate new file (S/N) ? ");
	gets(buf);
	buf[0] = toupper(buf[0]);
	f = (IORPTR) (buf[0] == 'S') 
		? ior_init("TEST", (char *) &r,sizeof(DATASIZE))
		: ior_open("TEST", (char *) &r,sizeof(DATASIZE))
		;
	while(1)   {
		puts("\t\t\tMENU PARA TESTE\n\n\n");
		puts("\t\t<1>  INSERE NOVO REGISTRO\n\n");
		puts("\t\t<2>  LE REGISTRO\n\n");
		puts("\t\t<3>  DELETA REGISTRO\n\n");
		puts("\t\t<4>  CONTA # DE REGISTROS\n\n");
		puts("\t\t<5>  LISTA ARQUIVO\n\n");
		puts("\t\t<6>  TERMINA\n\n");
		puts("\t\tSELECIONE SUA OPCAO: ");
		gets(buf);
		switch(toupper(buf[0]))  {
			case '1' :
				for(i = 1; i < 200; ++i)  {
					r.a = i;
					r.val = (float) i * 1.11;
					sprintf(r.d,"Cod %d", i);
					ior_write(f,i);
					}
				break;

			 	puts("\n\nTecle o numero do registro: " );
			 	gets(buf);
			 	i = atoi(buf);
				printf("\n\nVai gerar registro com chave %d\n",i);
				puts("Tecle conteudo: ");
				gets(r.d);
				ior_write(f,i);
				break;
			case '2' : 
				puts("\n\nQual a chave ? ");
			 	gets(buf);
			 	i = atoi(buf);
				if (!ior_testa(f,i))  
					printf("Chave %d nao foi gravada\n",i);
				else  {
					ior_read(f,i);
					puts(r.d);
					}
				puts("\nTecle qualquer tecla para continuar ...");
				gets(buf);
				break;
			case '3' :
				puts("\n\nQual a chave para deletar ? ");
			 	gets(buf);
			 	i = atoi(buf);
				if (!ior_testa(f,i))  
					printf("Chave %d nao foi gravada\n",i);
				else
					ior_desliga(f,i);
				puts("\nTecle qualquer tecla para continuar ...");
				gets(buf);
				break;
			case '4' :
				puts("\n\nContando ... ");
				for(i = -1, k = 0; (i = ior_next(f,i)) >= 0; )  
					++k;
				printf("\n\nO arquivo contem %d registros\n",k);
				puts("\nTecle qualquer tecla para continuar ...");
				gets(buf);
				break;
			case '5' :
				putchar('\n');
				for(i = -1, k = 0; (i = ior_next(f,i)) >= 0; )  {
					ior_read(f,i);
					printf("# %3d  --> %s %d %f\n",i, r.d, r.a, r.val);
					}
				puts("\nTecle qualquer tecla para continuar ...");
				gets(buf);
				break;
			case '6' :
				ior_close(f);
				exit(0);
			default  : break;
			}
		}
}
            


*/