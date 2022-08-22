% Taler 1 - Producto de matrices normal
% A es mxn, B es nxp, C = A x B es m x p
% Cij = S de i=1:m, j=1:p Aij x Bij
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
% y B. NOTA: x debe ser mayor o igual a m*n. Por eso trabajo con (m*n)+1
m=3;
n=2;
p=4;
A=f((m*n)+3,m,n)
B=f((n*p)+2,n,p)
%Inicializacion a ceros de la matriz producto robusto: PRL
%P=zeros(m,n);
%PR=zeros(m,n);
PRL=zeros(n,p);
% Producto matricial en loop - Puede hacerse en Matlab con P=A*B
%for i=1:m;
%    for j=1:n;    
%        P(i,j)=A(i,1)*B(1,j)+A(i,2)*B(2,j)+A(i,3)*B(3,j);%+A(i,4)*B(4,j)
%    end
%end
P=A*B;
% Producto matricial robusto para 3 x 3
%for i=1:m;
%    for j=1:n;
%        V=[A(i,1)*B(1,j) A(i,2)*B(2,j) A(i,3)*B(3,j)];
%        PR(i,j)=m*median(V);
%    end
%end
%PR
%  Prod Matricial Robusto GENERALIZANDO EL TAMAÑO DE LA MATRIZ a m x n
for i=1:m;
    for j=1:p;
        for k=1:n;
            VL(k)=A(i,k)*B(k,j);
        end
            PRL(i,j)=n*median(VL);
    end
end
P
PRL
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
% NOTA: codigo para m=n. Se deja aqui solo para posibles verficaciones.
%for i=1:m;
%    for j=1:n;
%        for k=1:m;
%            VL(k)=A(i,k)*B(k,j);
%        end
%            PRL(i,j)=m*median(VL);
%    end
%end
