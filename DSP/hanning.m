clc;
clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Filtro FIR, Ventana Hanning, Tipo I

N=41;
fc=0.3;
w=2*pi*fc;

h=[zeros(1,20)];
hf=[zeros(1,N)];
ho=2*fc;
 
for n = 1:20
  wn= 0.5 + (0.5*cos((2*pi*n)/N));
  h(n)=(2*fc)*(sin(n*w)/(n*w))*wn;
end

hf=[fliplr(h) ho h]
hf;
n=1:41;
stem(n,hf);
freqz(hf,1,1000,256)
save hf.mat hf
