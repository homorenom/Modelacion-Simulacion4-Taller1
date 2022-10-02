%% Copulas
data= data5;
X = data(:,1);
Y = data(:,2);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,1),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,1);
Y = data(:,3);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,2),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,1);
Y = data(:,4);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,3),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,1);
Y = data(:,5);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,4),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,2);
Y = data(:,3);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,5),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,2);
Y = data(:,4);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,6),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,2);
Y = data(:,5);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,7),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,3);
Y = data(:,4);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,8),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,3);
Y = data(:,5);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,9),plot(acum1,acum2,'o')
%% Copulas
data= data5;
X = data(:,4);
Y = data(:,5);

datos1 = X;
for i=1:length(datos1);
 acum1(i) = sum(datos1(i)<=datos1)/length(datos1);
end 

datos2 = Y;
for i=1:length(datos2);
 acum2(i) = sum(datos2(i)<=datos2)/length(datos2);
end 
subplot(2,5,10),plot(acum1,acum2,'o')