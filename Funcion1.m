prompt = '---------------------Data Orginal------------------------------'
%datab = readtable("datos.xlsx")
%data = table2array(datab);
data =  X;
prompt = 'New data: '
n = input(prompt) %cuantos datos nuevos quiere generar
%data = readtable('fileName.xlsx', 'Range', 'columna:columna'); si es un csv
datN = zeros(n, 1);
prompt = 'Clases: '
class_Num = input(prompt);%numero de clases
datTotal = length(data);
limInf = min(data)-0.1;
limSup = max(data)+0.1;
freq = (limSup-limInf)/class_Num;
Interval = [limInf:freq:limSup]; 
FreqAbs = zeros(class_Num, 1);
FreqRela = zeros(class_Num, 1);
Marca_Clase = (Interval + freq)/2;
for i = 1:datTotal
    i;
    j=floor((data(i,1)-limInf)/freq)+1;
    FreqAbs(floor((data(i,1)-limInf)/freq)+1)= FreqAbs(floor((data(i,1)-limInf)/freq)+1)+1;  
end

for i = 1:class_Num
    FreqRela(i,1)= FreqAbs(i,1)/datTotal; 
end

%Data generator
cont= 0; 
FreqAbsN = zeros(class_Num,1); 
FreqAbsAN = zeros(class_Num,1);
FreqAbsA = zeros(class_Num,1);
FreqRelaA = zeros(class_Num,1);

for i = 1:class_Num
    FreqAbsN(i,1) = n*FreqRela(i,1);   
    
    if i == 1
        FreqAbsA(i) = FreqAbs(i);
        FreqAbsAN(i) = FreqAbsN(i); 
        FreqRelaA(i) = FreqRela(i);
    else
        FreqAbsA(i) = FreqAbsA(i-1)+FreqAbs(i);
        FreqAbsAN(i) = FreqAbsAN(i-1)+FreqAbsN(i); 
        FreqRelaA(i) = FreqRelaA(i-1)+FreqRela(i);
    end

    for j= 1:FreqAbsN(i)
        cont = cont+1;
        datN(cont)= Interval(i)+rand(1)*freq;
    end
end


limiteinf=Interval(1:end-1)';  
limitesup= limiteinf+freq;  
MarcaClase = limiteinf+freq/2;  
Clase= [1:1:class_Num]'  ;
TABLA = table(Clase,limiteinf,limitesup,MarcaClase,FreqAbs,FreqAbsA,FreqAbsN,FreqAbsAN,FreqRela,FreqRelaA)  %Tabla de los datos 
percentil= 50/100;  
ubica= n*percentil ;
for i = 1:class_Num
    if ubica<FreqAbsAN(i) ;
        break
    end
end

prompt = '---------Indicadores------------'
media = (MarcaClase'*FreqAbs)/datTotal;
aux = (MarcaClase' - media).^2;
MarcaClase';
y = TABLA.FreqAbs;
j= mtimes(aux,y);
varianza =j/datTotal;
desv = sqrt(varianza);
[m,o] = max(TABLA.FreqAbs);
moda = TABLA.MarcaClase(o);
[m,l] = max(TABLA.FreqAbsN);
moda_nuevos = TABLA.MarcaClase(l);
x = floor(datN);
moda_sim =mode(x);
[minimoN,positionN]=min(abs(TABLA.FreqAbsAN-(n/2)));
media_nuevos = mean(datN);
mediana_nuevos = TABLA.MarcaClase(positionN);
[B,TF] = rmoutliers(data,'mean');
Dato_raro = data(TF)
media_acortada = mean(B)
%%%%Indicadores crudos
media_crudosN = mean(datN);
mediana_crudosN = median(datN);
moda_crudosN = floor(mode(datN));
varianza_crudosN = var(datN);
desv_crudosN = std(datN);
Simulados = table(media_crudosN, moda_crudosN, mediana_crudosN,  varianza_crudosN, desv_crudosN);
%%%%Indicadores crudos
media_crudos = mean(data);
mediana_crudos = median(data);
moda_crudos = mode(data);
varianza_crudos = var(data);
desv_crudos = std(data);
mediana_sim = median(x);

prompt = '-----------Cuantiles-------------'
crudos = quantile(data,[0.25 , 0.5, 0.75 ,0.975]);
q1 = datTotal*0.25;
q2= datTotal*0.5;
q3 = datTotal*0.75;
q4 = datTotal*0.95;
[minimoq1,positionq1]=min(abs(TABLA.FreqAbsA-q1));
positionq11 = positionq1;
if TABLA.FreqRelaA(positionq1) < 0.25
    positionq1 = positionq1+1;
    positionq11 = positionq1;
end
[minimoq2,positionq2]=min(abs(TABLA.FreqAbsA-q2));
positionq22 = positionq2;

if TABLA.FreqRelaA(positionq2) < 0.5
    positionq2 = positionq2+1;
    positionq22 = positionq2;
end
[minimoq3,positionq3]=min(abs(TABLA.FreqAbsA-q3));
positionq33 = positionq3;
if TABLA.FreqRelaA(positionq3) < 0.75
    positionq3 = positionq3+1;
    positionq33 = positionq3;
end
[minimoq4,positionq4]=min(abs(TABLA.FreqAbsA-q4));
positionq44 = positionq4
if TABLA.FreqRelaA(positionq4) < 0.95
    positionq4 = positionq4+1;
    positionq44 = positionq4;
end
Q1= TABLA.FreqAbsA(positionq1);
Q2= TABLA.FreqAbsA(positionq2);
Q3= TABLA.FreqAbsA(positionq3);
Q4= TABLA.FreqAbsA(positionq4);

if positionq11-1 == 0
    Cuartil1 = limiteinf(positionq11)+freq*((Q1-Q1)/Q1);
else
    
    q11 = TABLA.FreqAbsA(positionq11-1);
    Cuartil1 = limiteinf(positionq11)+freq*((q1-q11)/Q1);
end

if positionq22-1 == 0
    Cuartil2 = limiteinf(positionq22)+freq*((Q2-Q2)/Q2);
else
    q22 = TABLA.FreqAbsA(positionq22-1);
    Cuartil2 = limiteinf(positionq22)+freq*((q2-q22)/Q2);
end

if positionq33-1 == 0
    Cuartil3 = limiteinf(positionq33)+freq*((Q3-Q3)/Q3);
else
    q33 = TABLA.FreqAbsA(positionq33-1);
    Cuartil3 = limiteinf(positionq33)+freq*((q3-q33)/Q3);
end

if positionq44-1 == 0
    Total = limiteinf(positionq44)+freq*((Q4-Q4)/Q4);
else
    q44 = TABLA.FreqAbsA(positionq44-1);
    Total = limiteinf(positionq44)+freq*((q4-q44)/Q4);
end
tabla= table(Cuartil1, Cuartil2 ,Cuartil3, Total);
mediana = Cuartil2;
%tabla = [Q1,mediana, Q3, Q4]
indicadores_tabla = table(media,mediana, moda, varianza, desv, media_acortada)
ind_crudos = table(media_crudos, moda_crudos, mediana_crudos, varianza_crudos, desv_crudos)
Simulados
Nuevos = quantile(datN,[0.25 , 0.5, 0.75 ,0.975]);
Cuantiles = table(crudos, tabla, Nuevos)


prompt = '-----------Bar plots------------------'
tu = histogram(data ,class_Num);
xlabel('Marca de clase')
ylabel('Frecuencia')
hold on
e = histogram(datN ,class_Num);
xlabel('Marca de clase')
ylabel('Frecuencia Nuevos')
tu.Normalization = 'probability';
e.Normalization = 'probability';
figure
boxplot(data, 'Orientation', 'Horizontal')
xlabel('Marca de clase')
ylabel('Frecuencia plot con Outlyers')
figure
boxplot(B, 'Orientation', 'Horizontal')
xlabel('Marca de clase')
ylabel('Frecuencia plot sin ourlyers')
figure
subplot(3,1,1)
hist(data,class_Num)
title('Datos Crudos')
subplot(3,1,2)
bar(MarcaClase,FreqAbs,1)
%axis([41 200 0 15])
title('Datos Tabulados')
subplot(3,1,3)
hist(datN,class_Num)
title('Datos Simulados')

% title('Datos Simulados')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%datos nuevos total = datN
%data = data orginal
%datN;
%A = datN;
%[B,TF] = rmoutliers(A,'mean');