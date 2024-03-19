%TECNOLÓGICO NACIONAL DE MÉXICO
%INSTITUTO TÉCNOLOGICO DE MORELIA
%DEPARTAMENTO DE INGENIERÍA ELÉCTRICA Y ELECTRÓNICA
%ACADEMIA DE ELECTRÓNICA
%ASIGNATURA: PROCESAMIENTO Y ANALISIS DE SEÑALES
%DOCENTE: M.C. JULIO CESAR HERRERA
%PRÁCTICA: 5 - ANÁLISIS MULTIRESOLUCIÓN CON T. WAVELETES
%FECHA: NOVIEMBRE DEL 2017

%-----------------Limpieza y cierre de ventanas y variables----------------

clear %limpia todas las variables
close all %cierra las ventanas abiertas
clc %limpia la ventana de comandos

%------------------------Carga de señales ECG------------------------------

load ECG_RUIDO60.MAT  %Carga la señal ECG con ruido de 60 Hz
x1=ecg1;
% load ECG_LB.MAT  %Carga la señal ECG con ruido de linea base
% x2=ecg2;
% load ECG_RUIDOMUS.MAT  %Carga la señal ECG con ruido muscular
% x3=ecg3;

%--------------------Figura 1: Señal ECG con ruido-------------------------

figure(1)
fs=250;   %los archivos estan muestreados a 250 muestras por segundo
T=1/fs;
n = 1:1:length(x1);
r = 1000*sin(2*pi*0.2*n*T);
x = x1 + r;

plot(x,'r'); grid;
title('Señal Electrocardiográfica con Ruido')
fs=250;   %los archivos estan muestreados a 250 muestras por segundo

%------------------------Señal Spline & Gaus-------------------------------

h = [0.2 0.6 1 0.6 0.2]; %Gauss
g = [0.3 1 0.3 0 -0.3 -1 -0.3]; %Spline

figure(2)
suptitle "Magnitud"
subplot(2,1,1);
plot(h,'k');
title('Señal h')
subplot(2,1,2);
plot(g, 'k');
title('Señal g')

%------------------------Convoluciones & Detalles--------------------------

h1=[0.1 0.4 0.95 0.95 0.4 0.1];
g1=[0.9 0 -0.9];
g2=[0.25 0.9 0.25 -0.25 -0.9 -0.25];
g4 = [0.9 -0.9];

a1 = conv(x,h1);
a2 = conv(a1,h1);
a3 = conv(a2,h1);
a4 = conv(a3,h1);

d1 = conv(a1,g1);
d2 = conv(a2,g2);
d3 = conv(a3,g2);
d4 = conv(a4,g4);

figure(3)

%/title('Parámetros a1')
subplot(2,2,1);
plot(a1, 'm');
title('Parámetro a1');
grid();
axis([0,1501,-1000,2000])
subplot(2,2,2);
plot(a2, 'r');
title('Parámetro a2')
grid();
axis([0,1506,-2000,6000])
subplot(2,2,3);
plot(a3, 'm');
title('Parámetro a3')
grid();
axis([0,1511,-5000,15000])
subplot(2,2,4);
plot(a4, 'r');
title('Parámetro a4')
grid();
axis([0,1516,-20000,40000])

figure(4)
subplot(2,2,1);
plot(d1,'r');
title('Parámetro d1')
grid();
axis([0,1503,-2000,2000])
subplot(2,2,2);
plot(d2);
title('Parámetro d2')
grid();
axis([0,1511,-5000,5000])
subplot(2,2,3);
plot(d3,'k');
title('Parámetro d3')
axis([0,1516,-20000,20000])
umbral = 10200;
k = 1;
cont=1;
vec = zeros(9,1);
for k=1:length(d3)
    if d3(k)> umbral
        figure(4)
        subplot(2,2,3);
        hold on
        plot(k,d3(k),'.r');
    end
    if k > 5 && k < length(d3)-5 
        if d3(k) > umbral && d3(k+1) < umbral
           vec(cont) = k;
           cont = cont + 1;
        end
    end
end
sum = 0;
for k=2:9
     acum = vec(k) - vec(k-1);
     sum = sum + acum;
end
prom = sum / 8;
frec = (1/(prom*0.004))*60;
%legend('Frecuencia  Cardiaca','Location','northoutside');
grid();
subplot(2,2,4);
plot(d4,'m');
title('Parámetro d4')
grid();
axis([0,1517,-10000,10000])

figure(5)
% subplot(2,2,1);
% plot(d1,'r');
% title('Parámetro d1')
% grid();
% axis([0,1503,-2000,2000])
% subplot(2,2,2);
% plot(d2);
% title('Parámetro d2')
% grid();
% axis([0,1511,-5000,5000])
% subplot(2,2,3);

plot(x,'k');
title('Parámetro x')
axis([0,1516,-20000,20000])
umbral = 900;
k = 1;
cont=1;
vec = zeros(9,1);
for k=1:length(x)
    if x(k)>= umbral
        figure(5)
%         subplot(2,2,3);
        hold on
        plot(k,x(k),'.r');
    end
end