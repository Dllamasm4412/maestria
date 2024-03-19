%%
%% Generar filtros automaticamente
clc;
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Filtro IIR
prompt = '¿Cual es la frecuencia de rechazo 1 ';
prompt6  ='¿Cual es la frecuencia de rechazo 2 ';
prompt2 = '¿Cual es la banda de frecuencia de paso?  ';
prompt3 = '¿Cual es el ancho de banda? ';
prompt4 = '¿Cual es la frecuencia de muestreo? '; 
prompt5 = 'Seleccione tipo de filtro:\n 1. Pasa bajas \n 2. Pasa altas\n 3. Pasa Bandas\n 4. Rechaza bandas  '; 
frp = input(prompt2);
frz = input(prompt);
ancho=input(prompt3);
fs=input(prompt4);
%---------------
r = 1 -((ancho/fs)*pi);
syms z
denz1 = fs/frz;
fs1z1 = 2*pi;
angz1 = fs1z1/denz1;
angz2 = ((fs1z1)/denz1) + pi; ao= 1; a1= 0;
a2 = ((exp(j*(angz1)))*(exp(j*(angz2))));
b= [ao a1 a2]
% %---------------------------------------
 den2 = fs/frp;
 fs2 = 2*pi;
 angp1 = (fs2/den2);
 bo = 1; b1 = 0; b2 = ((r*(exp(j*(angp1))))*(r*(exp(-j*(angp1)))));
 a= [bo b1 b2]
 %-------------------------------------------------
 %Pasa banda
 
 
 
 
 
 
 

 freqz(b,a,1000,fs)
