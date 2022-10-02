%datos reales
i = data5(:,1);
nidatos = length(i);
subplot(5,1,1),ecdf(i)
nidatos = length(i);
imin = min(i);
imax = max(i);
ni = length(i);
idelta = (imax-imin)/ni;
acum = zeros(ni,1);
xi = imin:idelta:imax;
sumai = 1;
for o=imin: idelta: imax 
    acum(sumai) = sum(i<o)/nidatos;
    sumai = sumai+1;
end
hold on
subplot(5,1,1),plot(xi,acum)
%subplot(3,1,3),plot(xi,acum)
%title('reales')
fitlm(xi,acum)

%datos reales
i = data5(:,1);
nidatos = length(i);
subplot(5,1,2),ecdf(i)
nidatos = length(i);
imin = min(i);
imax = max(i);
ni = length(i);
idelta = (imax-imin)/ni;
acum = zeros(ni,1);
xi = imin:idelta:imax;
sumai = 1;
for o=imin: idelta: imax 
    acum(sumai) = sum(i<o)/nidatos;
    sumai = sumai+1;
end
hold on
subplot(5,1,2),plot(xi,acum)
%subplot(3,1,3),plot(xi,acum)
%title('reales')
fitlm(xi,acum)

%datos reales
i = data5(:,3);
nidatos = length(i);
subplot(5,1,3),ecdf(i)
nidatos = length(i);
imin = min(i);
imax = max(i);
ni = length(i);
idelta = (imax-imin)/ni;
acum = zeros(ni,1);
xi = imin:idelta:imax;
sumai = 1;
for o=imin: idelta: imax 
    acum(sumai) = sum(i<o)/nidatos;
    sumai = sumai+1;
end
hold on
subplot(5,1,3),plot(xi,acum)
%subplot(3,1,3),plot(xi,acum)
%title('reales')
fitlm(xi,acum)

%datos reales
i = data5(:,4);
nidatos = length(i);
subplot(5,1,4),ecdf(i)
nidatos = length(i);
imin = min(i);
imax = max(i);
ni = length(i);
idelta = (imax-imin)/ni;
acum = zeros(ni,1);
xi = imin:idelta:imax;
sumai = 1;
for o=imin: idelta: imax 
    acum(sumai) = sum(i<o)/nidatos;
    sumai = sumai+1;
end
hold on
subplot(5,1,4),plot(xi,acum)
%subplot(3,1,3),plot(xi,acum)
%title('reales')
fitlm(xi,acum)

%datos reales
i = data5(:,5);
nidatos = length(i);
subplot(5,1,5),ecdf(i)
nidatos = length(i);
imin = min(i);
imax = max(i);
ni = length(i);
idelta = (imax-imin)/ni;
acum = zeros(ni,1);
xi = imin:idelta:imax;
sumai = 1;
for o=imin: idelta: imax 
    acum(sumai) = sum(i<o)/nidatos;
    sumai = sumai+1;
end
hold on
subplot(5,1,5),plot(xi,acum)
%subplot(3,1,3),plot(xi,acum)
%title('reales')
fitlm(xi,acum)

