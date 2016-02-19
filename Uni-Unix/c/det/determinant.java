/*This function will return the determinant of any two dimensional matrix. For this particular function a two dimensional double matrix needs to be passed as arguments - Avishek Ghosh*/ 

public double determinant(double[][] mat) { 

double result = 0; 

if(mat.length == 1) { 
result = mat[0][0]; 
return result; 
} 

if(mat.length == 2) { 
result = mat[0][0] * mat[1][1] - mat[0][1] * mat[1][0]; 
return result; 
} 

for(int i = 0; i < mat[0].length; i++) { 
double temp[][] = new double[mat.length - 1][mat[0].length - 1]; 

for(int j = 1; j < mat.length; j++) { 
for(int k = 0; k < mat[0].length; k++) { 

if(k < i) { 
temp[j - 1][k] = mat[j][k]; 
} else if(k > i) { 
temp[j - 1][k - 1] = mat[j][k]; 
} 

} 
} 

result += mat[0][i] * Math.pow(-1, (double)i) * determinant(temp); 
} 

return result; 

}
