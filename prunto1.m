% Taler 1 - Producto de matrices normal
% A es mxn, B es nxk, C = A x B es m x k
% Cij = S de i=1:m, j=1:k Aij x Bij
% Daos de ensayo de multiplicacion de matrices, para entender el algoritmo
%A=[1 3 5 1;2 4 6 1;7 8 19 1;1 1 1 1];
%B=[1 2 2 1;3 3 5 1;4 4 7 1;1 1 1 1];
% Producto matricial a mano
%C=[A(1,1)*B(1,1)+A(1,2)*B(2,1)+A(1,3)*B(3,1) A(1,1)*B(1,2)+A(1,2)*B(2,2)+A(1,3)*B(3,2) A(1,1)*B(1,3)+A(1,2)*B(2,3)+A(1,3)*B(3,3);
%    A(2,1)*B(1,1)+A(2,2)*B(2,1)+A(2,3)*B(3,1) A(2,1)*B(1,2)+A(2,2)*B(2,2)+A(2,3)*B(3,2) A(2,1)*B(1,3)+A(2,2)*B(2,3)+A(2,3)*B(3,3);
%    A(3,1)*B(1,1)+A(3,2)*B(2,1)+A(3,3)*B(3,1) A(3,1)*B(1,2)+A(3,2)*B(2,2)+A(3,3)*B(3,2) A(3,1)*B(1,3)+A(3,2)*B(2,3)+A(3,3)*B(3,3)];
% DIMENSIONES DE LAS MATRICES
% Matriz m x n
% función para generar matriz random m*n
f = @(x,m,n) reshape(randperm(x,m*n),m,n);
% llamo la funcion con x(semilla), m filas, n columnas y genero matrices A
% y B
A=f(23,3,3)
B=f(23,3,3)
m=3;
n=3;
% Producto matricial en loop - Puede hacerse en Matlab con P=A*B
P=zeros(m,n);
PR=zeros(m,n);
for i=1:m;
    for j=1:n;    
        P(i,j)=A(i,1)*B(1,j)+A(i,2)*B(2,j)+A(i,3)*B(3,j);%+A(i,4)*B(4,j)
    end
end
P
% Producto matricial robusto
% for i=1:m;
%     for j=1:n;
%         V=[A(i,1)*B(1,j) A(i,2)*B(2,j) A(i,3)*B(3,j)];
%         PR(i,j)=m*median(V);
%     end
% end
% PR
for i=1:m;
    for j=1:n;
        V=[A(i,1)*B(1,j)] %A(i,2)*B(2,j) A(i,3)*B(3,j)]
        %PR(i,j)=m*median(V);
    end
end
PR
% Calculo de MAD = mediana(|Yi - mediana(Yi)|)
datoslog=-log(rand(100,1));
%datoslog=randn(100,1);
vdesv=zeros(100,1); % vector vacio de 100 componentes
med=median(datoslog) % mediana de datoslog
% Calculo de valor absoluto de las desviaciones respecto a la mediana
for i=1:100;
    vdesv(i)=abs(datoslog(i)-median(datoslog));
end
% Calculo de MAD como la mediana del vector de v.abs de desviaciones.
MAD=median(vdesv)
DesvT=std(datoslog)
% GENERALIZANDO EL TAMAÑO DE LA MATRIZ
%for i=1:m;
%    for j=1:n;
%        for k=1:m;
%            V=[A(i,k)*B(k,j) A(i,k)*B(2,j) A(i,3)*B(3,j)];
%            PR(i,j)=m*median(V);
%    end
%end