// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TMerge2V.cpp    

#include "Merge2V2.h"

Merge2V <(26 * 26)> M2V("A.DAT","A2.DAT");

void Simula_Dados()
{
	Data Registro;
	int  I, J;

	// Abre o arquivo de entrada 
	M2V.A_In = fopen(M2V.Entrada,"wb");
	if (M2V.A_In == NULL)  {
		cout << "Nao pode gerar o arquivo " << M2V.Entrada << '\n';
		exit(1);
		}

	// Produz dados para ordenação 
	Registro.Idade   = 18;
	Registro.Salario = 1000.0;

	// Grave N registros sendo que o nome (chave) de cada
	// registro é composto por duas letras geradas em
	// ordem inversa                                      
	for(I = 25; I >= 0; --I) {
		Registro.Nome[0] = I + 'A';
		for(J = 25; J >= 0; --J) {
			Registro.Nome[1] = J + 'a';
			if (fwrite(&Registro,sizeof(Data),1,M2V.A_In) != 1) {
				cout << "Nao pode gravar registro do arquivo " 
				     << M2V.Entrada << '\n';
				exit(1);
				}
			Registro.Idade   = Registro.Idade + 1;
			Registro.Salario = Registro.Salario + 500.0;
			if (Registro.Idade > 69)
				Registro.Idade = 18;
			if (Registro.Salario > 5000.00)
				Registro.Salario = 1000.0;
			}
		}

	fclose(M2V.A_In);

} // Simula_Dados 


// Verifica se as chaves estão em ordem 
void Verifica_Ordenacao()
{
	int  I, Tag;
	Data Registro, Registro2;

	// Abre o arquivo de entrada 
	M2V.A_In = fopen(M2V.Entrada,"rb");
	if (M2V.A_In == NULL)  {
		cout << "Nao pode acessar o arquivo " << M2V.Entrada << '\n';
		exit(1);
		}

	// Abre o arquivo de referência 
	M2V.A_Out = fopen(M2V.Saida,"rb");
	if (M2V.A_Out == NULL)  {
		cout << "Nao pode acessar o arquivo " << M2V.Saida 
		     << '\n';
		exit(1);
		}

	// Leia o tag do registro com a menor chave 
	if (fread(&Tag,sizeof(int),1,M2V.A_Out) != 1) {
		cout << "Nao pode ler registro do arquivo " << M2V.Saida 
		     << '\n';
		exit(1);
		}

	// Posicione o arquivo de entrada para ler
	// o registro associado com este tag      
	fseek(M2V.A_In,Tag * sizeof(Data), 0L);

	// Leia o registro completo do arquivo de entrada 
	if (fread(&Registro,sizeof(Data),1,M2V.A_In) != 1) {
		cout << "Nao pode ler registro " << Tag + 1 << 
			    " do arquivo " << M2V.Entrada << '\n';
		exit(1);
		}

	// Verifica se a chave de um registro é
	// maior que a de sucessor para todos os registros 
	I = 1;
	while (I < (M2V.M * 2)) {
		if (fread(&Tag,sizeof(int),1,M2V.A_Out) != 1) {
			cout << "Nao pode ler registro do arquivo " 
			     << M2V.Saida << '\n';
			exit(1);
			}
		fseek(M2V.A_In,Tag * sizeof(Data), 0L);
		if (fread(&Registro2,sizeof(Data),1,M2V.A_In) != 1) {
			cout << "Nao pode ler registro " << Tag + 1 <<
				    " do arquivo " << M2V.Entrada << '\n';
			exit(1);
			}
		if (strcmp(Registro.Nome,Registro2.Nome) > 0) {
			cout << "O registro " << I << " esta' fora de ordem...\n";
			cout << Registro.Nome << ' ' << Registro2.Nome << 
				    ' ' << Tag + 1;
			exit(1);
			}
		Registro = Registro2;
		I = I + 1;
		}

	fclose(M2V.A_In);
	fclose(M2V.A_Out);

	unlink(M2V.Saida); // Remove o arquivo de referência 

	cout << "A ordem esta' correta!\n";

} // Verifica_Ordenacao 


void main()
{
	Simula_Dados();

	M2V.Merge_Duas_Vias();

	Verifica_Ordenacao();

} // main 