-- (C) 1999, Arthur Vargas Lopes
-- Arquivo fonte TDAArray.Adb
package body Arrays is
	function "+"(V1, V2 : Vetor_Integer) return Vetor_Integer is
		R : Vetor_Integer(V1'Range);
		J : Integer := V2'First;
	begin
		if V1'Length /= V2'Length then
			raise Vetores_Nao_Conformados;
		end if;
		for I in V1'Range loop
			R(I) := V1(I) + V2(J);
			J := J + 1;
		end loop;
		return R;		
	end "+";

	function "-"(V1, V2 : Vetor_Integer) return Vetor_Integer is	
		R : Vetor_Integer(V1'Range);
		J : Integer := V2'First;
	begin
		if V1'Length /= V2'Length then
			raise Vetores_Nao_Conformados;
		end if;
		for I in V1'Range loop
			R(I) := V1(I) - V2(J);
			J := J + 1;
		end loop;
		return R;		
	end "-";

	function "*"(V1, V2 : Vetor_Integer) return Vetor_Integer is
		R : Vetor_Integer(V1'Range);
		J : Integer := V2'First;
	begin
		if V1'Length /= V2'Length then
			raise Vetores_Nao_Conformados;
		end if;
		for I in V1'Range loop
			R(I) := V1(I) * V2(J);
			J := J + 1;
		end loop;
		return R;		
	end "*";

	function "/"(V1, V2 : Vetor_Integer) return Vetor_Integer is
		R : Vetor_Integer(V1'Range);
		J : Integer := V2'First;
	begin
		if V1'Length /= V2'Length then
			raise Vetores_Nao_Conformados;
		end if;
		for I in V1'Range loop
			R(I) := V1(I) / V2(J);
			J := J + 1;
		end loop;
		return R;		
	end "/";

	function "+"(V1, V2 : Vetor_Float) return Vetor_Float is
		R : Vetor_Float(V1'Range);
		J : Integer := V2'First;
	begin
		if V1'Length /= V2'Length then
			raise Vetores_Nao_Conformados;
		end if;
		for I in V1'Range loop
			R(I) := V1(I) + V2(J);
			J := J + 1;
		end loop;
		return R;		
	end "+";

	function "-"(V1, V2 : Vetor_Float) return Vetor_Float is	
		R : Vetor_Float(V1'Range);
		J : Integer := V2'First;
	begin
		if V1'Length /= V2'Length then
			raise Vetores_Nao_Conformados;
		end if;
		for I in V1'Range loop
			R(I) := V1(I) - V2(J);
			J := J + 1;
		end loop;
		return R;		
	end "-";

	function "*"(V1, V2 : Vetor_Float) return Vetor_Float is
		R : Vetor_Float(V1'Range);
		J : Integer := V2'First;
	begin
		if V1'Length /= V2'Length then
			raise Vetores_Nao_Conformados;
		end if;
		for I in V1'Range loop
			R(I) := V1(I) * V2(J);
			J := J + 1;
		end loop;
		return R;		
	end "*";

	function "/"(V1, V2 : Vetor_Float) return Vetor_Float is
		R : Vetor_Float(V1'Range);
		J : Integer := V2'First;
	begin
		if V1'Length /= V2'Length then
			raise Vetores_Nao_Conformados;
		end if;
		for I in V1'Range loop
			R(I) := V1(I) / V2(J);
			J := J + 1;
		end loop;
		return R;		
	end "/";
	
	function "+"(M1, M2 : Matriz_Integer) return Matriz_Integer is
		R  : Matriz_Integer(M1'Range,M1'Range(2));
		I2 : Integer := M2'First;
		J2 : Integer;
	begin
		if (M1'Length /= M2'Length) or
		   (M1'Length(2) /= M2'Length(2)) then
			raise Matrizes_Nao_Conformadas;
		end if;
		for I in M1'Range loop
			J2 := M2'First(2);
			for J in  M1'Range(2) loop
				R(I,J) := M1(I,J) + M2(I2,J2);
				J2     := J2 + 1;
			end loop;
			I2 := I2 + 1;
		end loop;
		return R;		
	end "+";

	function "-"(M1, M2 : Matriz_Integer) return Matriz_Integer is
		R : Matriz_Integer(M1'Range,M1'Range(2));
		I2 : Integer := M2'First;
		J2 : Integer;
	begin
		if (M1'Length /= M2'Length) or
		   (M1'Length(2) /= M2'Length(2)) then
			raise Matrizes_Nao_Conformadas;
		end if;
		for I in M1'Range loop
			J2 := M2'First(2);
			for J in  M1'Range(2) loop
				R(I,J) := M1(I,J) - M2(I2,J2);
				J2     := J2 + 1;
			end loop;
			I2 := I2 + 1;
		end loop;
		return R;		
	end "-";

	function "*"(M1, M2 : Matriz_Integer) return Matriz_Integer is
		R : Matriz_Integer(M1'Range,M1'Range(2));
		I2 : Integer := M2'First;
		J2 : Integer;
	begin
		if (M1'Length /= M2'Length) or
		   (M1'Length(2) /= M2'Length(2)) then
			raise Matrizes_Nao_Conformadas;
		end if;
		for I in M1'Range loop
			J2 := M2'First(2);
			for J in  M1'Range(2) loop
				R(I,J) := M1(I,J) * M2(I2,J2);
				J2     := J2 + 1;
			end loop;
			I2 := I2 + 1;
		end loop;
		return R;		
	end "*";

	function "/"(M1, M2 : Matriz_Integer) return Matriz_Integer is
		R : Matriz_Integer(M1'Range,M1'Range(2));
		I2 : Integer := M2'First;
		J2 : Integer;
	begin
		if (M1'Length /= M2'Length) or
		   (M1'Length(2) /= M2'Length(2)) then
			raise Matrizes_Nao_Conformadas;
		end if;
		for I in M1'Range loop
			J2 := M2'First(2);
			for J in  M1'Range(2) loop
				R(I,J) := M1(I,J) / M2(I2,J2);
				J2     := J2 + 1;
			end loop;
			I2 := I2 + 1;
		end loop;
		return R;		
	end "/";

	function "+"(M1, M2 : Matriz_Float) return Matriz_Float is	
		R : Matriz_Float(M1'Range,M1'Range(2));
		I2 : Integer := M2'First;
		J2 : Integer;
	begin
		if (M1'Length /= M2'Length) or
		   (M1'Length(2) /= M2'Length(2)) then
			raise Matrizes_Nao_Conformadas;
		end if;
		for I in M1'Range loop
			J2 := M2'First(2);
			for J in  M1'Range(2) loop
				R(I,J) := M1(I,J) + M2(I2,J2);
				J2     := J2 + 1;
			end loop;
			I2 := I2 + 1;
		end loop;
		return R;		
	end "+";

	function "-"(M1, M2 : Matriz_Float) return Matriz_Float is	
		R : Matriz_Float(M1'Range,M1'Range(2));
		I2 : Integer := M2'First;
		J2 : Integer;
	begin
		if (M1'Length /= M2'Length) or
		   (M1'Length(2) /= M2'Length(2)) then
			raise Matrizes_Nao_Conformadas;
		end if;
		for I in M1'Range loop
			J2 := M2'First(2);
			for J in  M1'Range(2) loop
				R(I,J) := M1(I,J) - M2(I2,J2);
				J2     := J2 + 1;
			end loop;
			I2 := I2 + 1;
		end loop;
		return R;		
	end "-";

	function "*"(M1, M2 : Matriz_Float) return Matriz_Float is	
		R : Matriz_Float(M1'Range,M1'Range(2));
		I2 : Integer := M2'First;
		J2 : Integer;
	begin
		if (M1'Length /= M2'Length) or
		   (M1'Length(2) /= M2'Length(2)) then
			raise Matrizes_Nao_Conformadas;
		end if;
		for I in M1'Range loop
			J2 := M2'First(2);
			for J in  M1'Range(2) loop
				R(I,J) := M1(I,J) * M2(I2,J2);
				J2     := J2 + 1;
			end loop;
			I2 := I2 + 1;
		end loop;
		return R;		
	end "*";

	function "/"(M1, M2 : Matriz_Float) return Vetor_Float is
		R : Matriz_Float(M1'Range,M1'Range(2));
		I2 : Integer := M2'First;
		J2 : Integer;
	begin
		if (M1'Length /= M2'Length) or
		   (M1'Length(2) /= M2'Length(2)) then
			raise Matrizes_Nao_Conformadas;
		end if;
		for I in M1'Range loop
			J2 := M2'First(2);
			for J in  M1'Range(2) loop
				R(I,J) := M1(I,J) / M2(I2,J2);
				J2     := J2 + 1;
			end loop;
			I2 := I2 + 1;
		end loop;
		return R;		
	end "/";

end Arrays;