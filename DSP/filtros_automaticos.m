%% Generar filtros automaticamente
clc;
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Filtro FIR, Ventana Hanning
prompt1 = '¿Cual es la frecuencia de banda de paso? ';
prompt2 = '¿Cual es la frecuencia limite de banda de rechazo? ';
prompt3 = '¿Cual es la atenuacion ';
prompt4 = '¿Cual es la frecuencia de muestreo? '; 
prompt5 = 'Seleccione tipo de filtro:\n 1. Pasa bajas \n 2. Pasa altas\n 3. Pasa Bandas\n 4. Rechaza bandas  '; 
frc1 = input(prompt1);
frc2 = input(prompt2);
abt= frc2 - frc1;
tipo=input(prompt5);
atenuacion=input(prompt3);
fs=input(prompt4);
%---------------
abtn= abt/fs;
if atenuacion < 44
N1= round(3.1/abtn) + 1;
if N1 >71
    prompt7 = 'Escoger una frecuencia de corte 2 mas grande: ';
    frc21 = input(prompt7);
    abt= (frc21) - (frc1);
    abtn= abt/fs;
    Nh1= round(3.1/abtn);
    
else 
    Nh1 = N1;
end 
Nh= round((Nh1-1)/2)*2+1 %%redondear a siguiente impar
N2= round((Nh-1)/2)
wc = (abt*2*pi)/fs
fc= (abt/fs)
w=2*pi*fc;
h=[zeros(1,N2)];
hf=[zeros(1,Nh)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%Pasa bajas
if tipo ==1 
    ho=2*fc;
    s= 2*fc;
    for n = 1:N2
  wn= 0.5 + (0.5*cos((2*pi*n)/Nh));
  h(n)=(s)*(sin(n*w)/(n*w))*wn;
    end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Pasa bajas
elseif (tipo == 2)
    ho=1-2*fc;
    s= -2*fc;
for n = 1:N2
  wn= 0.5 + (0.5*cos((2*pi*n)/Nh));
  h(n)=(s)*(sin(n*w)/(n*w))*wn;
end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Pasa bandas
elseif tipo == 3
    
    fc1 = frc1/fs;
    fc2 = frc2/fs;
    wc1 = (frc1*2*pi)/fs
    wc2 = (frc2*2*pi)/fs
    ho=2*(fc2-fc1);
    s= 2*(fc2);
    s2= -2*(fc1);
for n = 1:N2
  wn= 0.5 + (0.5*cos((2*pi*n)/Nh));
  h(n)=((s)*(sin(n*wc2)/(n*wc2)) + ((s2)*((sin(n*wc1))/(n*wc1))))*wn;
end  
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Rechaza bandas
    elseif tipo == 4
    
    fc1 = frc1/fs;
    fc2 = frc2/fs;
    wc1 = (frc1*2*pi)/fs
    wc2 = (frc2*2*pi)/fs
    ho=1-2*(fc2-fc1);
    s= -2*(fc2);
    s2= 2*(fc1);
for n = 1:N2
  wn= 0.5 + (0.5*cos((2*pi*n)/Nh));
  h(n)=((s2)*(sin(n*wc1)/(n*wc1)) + ((s)*((sin(n*wc2))/(n*wc2))))*wn;
end  
    
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%Filtro Hamming
elseif (atenuacion > 44 )&& (atenuacion < 53)
    N1= round(3.3/abtn) + 1;
    if N1 >71
    prompt7 = 'Escoger una frecuencia de corte 2 mas grande: ';
    frc21 = input(prompt7);
    abt= (frc21) - (frc1);
    abtn= abt/fs;
    Nh1= round(3.3/abtn)
  
else 
    Nh1 = N1;
    end   
Nh= round((Nh1-1)/2)*2+1 %%redondear a siguiente impar
     N2= ((Nh-1)/2)
    wc = (abt*2*pi)/fs
    fc= (abt/fs)
    w=2*pi*fc;
    h=[zeros(1,10)];
    hf=[zeros(1,Nh)];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Pasa altas
    if tipo ==1 
    ho=2*fc;
    s= 2*fc;
    for n = 1:N2
  wn= 0.54 + (0.46*cos((2*pi*n)/Nh));
  h(n)=(s)*(sin(n*w)/(n*w))*wn;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Pasa altas
elseif (tipo == 2) 
    ho=1-2*fc;
    s= -2*fc;
for n = 1:N2
  wn= 0.54 + (0.46*cos((2*pi*n)/Nh));
  h(n)=(s)*(sin(n*w)/(n*w))*wn;
end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Pasa bandas
elseif tipo == 3
    fc1 = frc1/fs;
    fc2 = frc2/fs;
    wc1 = (frc1*2*pi)/fs
    wc2 = (frc2*2*pi)/fs
    ho=2*(fc2-fc1);
    s= 2*(fc2);
    s2= -2*(fc1);
for n = 1:N2
 wn= 0.54 + (0.46*cos((2*pi*n)/Nh));
  h(n)=((s)*(sin(n*wc2)/(n*wc2)) + ((s2)*((sin(n*wc1))/(n*wc1))))*wn;
end  
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Rechaza bandas
    elseif tipo == 4
    fc1 = frc1/fs;
    fc2 = frc2/fs;
    wc1 = (frc1*2*pi)/fs
    wc2 = (frc2*2*pi)/fs
    ho=1-2*(fc2-fc1);
    s= -2*(fc2);
    s2= 2*(fc1);
for n = 1:N2
 wn= 0.54 + (0.46*cos((2*pi*n)/Nh));
  h(n)=((s2)*(sin(n*wc1)/(n*wc1)) + ((s)*((sin(n*wc2))/(n*wc2))))*wn;
end  
    end  
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Blackman
elseif (atenuacion > 53 )&& (atenuacion < 75)    
    N1= round(5.5/abtn) + 1;  
        if N1 >71
      prompt7 = 'Escoger una frecuencia de corte 2 mas grande: ';
    frc21 = input(prompt7);
    abt= (frc21) - (frc1);
    abtn= abt/fs;
    Nh1= round(5.5/abtn)
   
else 
    Nhh1 = N1;
        end 
Nh= round((Nh1-1)/2)*2+1 %%redondear a siguiente impar
    N2= ((Nh-1)/2)
    wc = (abt*2*pi)/fs
    fc= (abt/fs)
    w=2*pi*fc;
    h=[zeros(1,10)];
    hf=[zeros(1,Nh)];
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Pasa bajas
    if tipo ==1 
    ho=2*fc;
    s= 2*fc;
    for n = 1:N2
  wn= 0.42 + (0.5*cos((2*pi*n)/(Nh-1))) + (0.8*cos((4*pi*n)/(Nh-1)));
  h(n)=(s)*(sin(n*w)/(n*w))*wn;
    end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Pasa altas
elseif (tipo == 2)
    ho=1-2*fc;
    s= -2*fc;
for n = 1:N2
 wn= 0.42 + (0.5*cos((2*pi*n)/(Nh-1))) + (0.8*cos((4*pi*n)/(Nh-1)));
  h(n)=(s)*(sin(n*w)/(n*w))*wn;
end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Pasa bandas
elseif tipo == 3
    
    fc1 = frc1/fs;
    fc2 = frc2/fs;
    wc1 = (frc1*2*pi)/fs
    wc2 = (frc2*2*pi)/fs
    ho=2*(fc2-fc1);
    s= 2*(fc2);
    s2= -2*(fc1);
for n = 1:N2
wn= 0.42 + (0.5*cos((2*pi*n)/(Nh-1))) + (0.8*cos((4*pi*n)/(Nh-1)));
  h(n)=((s)*(sin(n*wc2)/(n*wc2)) + ((s2)*((sin(n*wc1))/(n*wc1))))*wn;
end  
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    %Rechaza bandas
    elseif tipo == 4
    
    fc1 = frc1/fs;
    fc2 = frc2/fs;
    wc1 = (frc1*2*pi)/fs
    wc2 = (frc2*2*pi)/fs
    ho=1-2*(fc2-fc1);
    s= -2*(fc2);
    s2= 2*(fc1);
for n = 1:N2
 wn= 0.42 + (0.5*cos((2*pi*n)/(Nh-1))) + (0.8*cos((4*pi*n)/(Nh-1)));
  h(n)=((s2)*(sin(n*wc1)/(n*wc1)) + ((s)*((sin(n*wc2))/(n*wc2))))*wn;
end 
    end   
end
hf=[fliplr(h) ho h]
hf;
n=1:Nh;
stem(n,hf);
freqz(hf,1,1000,fs)
save hf.mat hf