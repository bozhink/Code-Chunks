// (C) 1999, Arthur Vargas Lopes 
// Arquivo fonte TMergePV.cpp    

#include "MergePV2.h"

MergePV <(26 * 26),4> MPV("A.DAT","A2.DAT");

void Simula_Dados()
{
	Data Registro;
	int  I, J;

	// Abre o arquivo de entrada 
	MPV.A_In = fopen(MPV.Entrada,"wb");
	if (MPV.A_In == NULL)  {
		cout << "Nao pode gerar o arquivo " << MPV.Entrada << '\n';
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
			if (fwrite(&Registro,sizeof(Data),1,MPV.A_In) != 1) {
				cout << "Nao pode gravar registro do arquivo " 
				     << MPV.Entrada << '\n';
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

	fclose(MPV.A_In);

} // Simula_Dados 


// Verifica se as chaves estão em ordem 
void Verifica_Ordenacao()
{
	int  I, Tag;
	Data Registro, Registro2;

	// Abre o arquivo de entrada 
	MPV.A_In = fopen(MPV.Entrada,"rb");
	if (MPV.A_In == NULL)  {
		cout << "Nao pode acessar o arquivo " << MPV.Entrada << '\n';
		exit(1);
		}

	// Abre o arquivo de referência 
	MPV.A_Out = fopen(MPV.Saida,"rb");
	if (MPV.A_Out == NULL)  {
		cout << "Nao pode acessar o arquivo " << MPV.Saida 
		     << '\n';
		exit(1);
		}

	// Leia o tag do registro com a menor chave 
	if (fread(&Tag,sizeof(int),1,MPV.A_Out) != 1) {
		cout << "Nao pode ler registro do arquivo " << MPV.Saida 
		     << '\n';
		exit(1);
		}

	// Posicione o arquivo de entrada para ler
	// o registro associado com este tag      
	fseek(MPV.A_In,Tag * sizeof(Data), 0L);

	// Leia o registro completo do arquivo de entrada 
	if (fread(&Registro,sizeof(Data),1,MPV.A_In) != 1) {
		cout << "Nao pode ler registro " << Tag + 1 << 
			    " do arquivo " << MPV.Entrada << '\n';
		exit(1);
		}

	// Verifica se a chave de um registro é
	// maior que a de sucessor para todos os registros 
	I = 1;
	while (I < (MPV.M * 2)) {
		if (fread(&Tag,sizeof(int),1,MPV.A_Out) != 1) {
			cout << "Nao pode ler registro do arquivo " 
			     << MPV.Saida << '\n';
			exit(1);
			}
		fseek(MPV.A_In,Tag * sizeof(Data), 0L);
		if (fread(&Registro2,sizeof(Data),1,MPV.A_In) != 1) {
			cout << "Nao pode ler registro " << Tag + 1 <<
				    " do arquivo " << MPV.Entrada << '\n';
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

	fclose(MPV.A_In);
	fclose(MPV.A_Out);

	unlink(MPV.Saida); // Remove o arquivo de referência 

	cout << "A ordem esta' correta!\n";

} // Verifica_Ordenacao 


void main()
{
	Simula_Dados();

	MPV.Merge_P_Vias();

	Verifica_Ordenacao();

} // main 