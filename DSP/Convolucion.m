clear all
clc
%Filtro Pasa-Bajas Hanning
h(20)=zeros;
fc=0.078;
wcn=0.49;
N=41;
%Para obtener la parte positiva de la respuesta del filtro
for n=1:20
w(n)=0.5+0.5*cos(2*pi*n/41);
hd(n)=2*fc*sin(n*wcn)/(n*wcn);
h(20+n+1)=hd(n)*w(n)
h(21)=2*fc
end
%Para hacer simétrica la respuesta del filtro
for n=1:20
h(21-n)=h(21+n)
end
t= 0:1/256:0.6; %Duración 3 ciclos de señal senoidal de 5 Hz;
s1 = sin(2*pi*5*t);
s2 = sin(2*pi*20*t);
s3 = sin(2*pi*100*t);
senal = [s1, s2, s3];
x = zeros(1,length(h));
y = zeros(1,length(senal));
for n = 1:length(senal)
x(1) = senal(n);
for k = 1:length(h)
y(n) = y(n) + h(k)*x(k);
end
for k=length(h):-1:2
x(k) = x(k-1);
end
end
t= 0:1/256:0.6; %Duración 3 ciclos de señal senoidal de 5 Hz;
s1 = sin(2*pi*5*t); %Senoidal de 5Hz
s2 = sin(2*pi*20*t); %Senoidal de 20Hz
s3 = sin(2*pi*100*t); %Senoidal de 100Hz
senal = [s1, s2, s3]; %Senales concatenadas
2
x = zeros(1,length(h));
y = zeros(1,length(senal));
%Para realizar la convolución
for n = 1:length(senal)
x(1) = senal(n);
for k = 1:length(h)
y(n) = y(n) + h(k)*x(k);
end
for k=length(h):-1:2
x(k) = x(k-1);
end
end
%Graficado de las señales
figure (1)
subplot(2,1,1)
plot(senal)
grid on
title('Señales de 5Hz, 25Hz y 100Hz')
subplot(2,1,2)
plot(y)
title('Señales filtradas por un filtro pasa bajas fc=10Hz')

