-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte GrafoV.Ads
generic
	N : Integer;
	type Tipo_Dado is limited private;
	MValor : Tipo_Dado;

package Grafo_Valorado is

	type Grafo is array(1 .. N, 1 .. N) of Tipo_Dado;

	procedure Inicializa(G : in out Grafo);
	procedure Conecta(G : in out Grafo; I, J : Integer; V : Tipo_Dado);
	procedure Desconecta(G : in out Grafo; I, J : Integer);
	function Adjacente(G : in Grafo; I, J : Integer) return Tipo_Dado;
	procedure Imprime(G : in Grafo);
	procedure Menores_Custos(G : Grafo; C : in out Grafo);
	procedure Gera_Caminhos(G : Grafo; P : in out Grafo);
	procedure Exibe_Caminho(P : Grafo; I, J, F : Integer := 1);
	procedure Menor_Caminho(G : Grafo; I, J : Integer);
	procedure Gera_Conectividade(G : Grafo; Cd : in out Grafo);
	function Centro(G : Grafo) return Integer ;

	procedure Put(Item : Float; Fore : Positive; Aft : Positive := 2);

end Grafo_Valorado;