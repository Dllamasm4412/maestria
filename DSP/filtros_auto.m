%% Generar filtros automaticamente
clc;
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prompt = 'Seleccione el tipo de diseño de filtro:\n 1. Filtro FIR \n 2. Filtro IIR  ';
if input(prompt) == 1
prompt1 = '¿Cual es la frecuencia de banda de paso? ';
prompt2 = '¿Cual es la frecuencia limite de banda de rechazo? ';
frc1 = input(prompt1);
frc2 = input(prompt2);
if frc1>=frc2
      fprintf('Es necesario rediseñar el filtro, se requiere una frecuencia mayor la frecuencia de banda de paso\n ');
      prompt2 = '¿Cual es la frecuencia limite de banda de rechazo? ';
    frc2 = input(prompt2);    
end 
prompt4 = '¿Cual es la frecuencia de muestreo? '; 
fs=input(prompt4);
if (fs< 10*frc2)
    fprintf('Es necesario rediseñar el filtro , se requiere una fs mayor\n ');
     prompt4 = '¿Cual es la frecuencia de muestreo? ';  
    fs=input(prompt4);
elseif fs<10*frc1
    fprintf('Es necesario rediseñar el filtro , se requiere una fs mayor\n ');
     prompt4 = '¿Cual es la frecuencia de muestreo? ';  
end 
prompt3 = '¿Cuál es la atenuacion ';

prompt5 = 'Seleccione tipo de filtro:\n 1. Pasa bajas \n 2. Pasa altas\n 3. Pasa Bandas\n 4. Rechaza bandas  '; 
abt= frc2 - frc1;
tipo=input(prompt5);
atenuacion=input(prompt3);

%---------------
abtn= abt/fs;
if atenuacion < 44
N1= round(3.1/abtn) + 1;
if N1 >71
      fprintf('Es necesario rediseñar el filtro\n');
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
        fprintf('Es necesario rediseñar el filtro\n');
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
   fprintf('Es necesario rediseñar el filtro\n');
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
else 
    prompt1 = 'Seleccione tipo de filtro:\n 1. Pasa bajas \n 2. Pasa altas\n 3. Pasa Bandas\n 4. Rechaza bandas  '; 
    prompt2 = '¿Cual es la frecuencia de corte 1? ';   
    prompt3 = '¿Cual es la frecuencia de corte 2? ';
    frc1 = input(prompt2);
    frc2 = input(prompt3);
    if frc1>frc2
      fprintf('Es necesario rediseñar el filtro, se requiere una frecuencia mayor la frecuencia de banda de paso\n ');
      prompt2 = '¿Cual es la frecuencia limite de banda de rechazo? ';
    frc2 = input(prompt2);    
end 
    prompt4 = '¿Cual es la frecuencia de muestreo? ';     
fs=input(prompt4);
if fs< (10*frc2)
    fprintf('Es necesario rediseñar el filtro , se requiere una fs mayor\n ');
     prompt4 = '¿Cual es la frecuencia de muestreo? ';  
    fs=input(prompt4);      
end 
    tipo=input(prompt1);
    T=1/fs;
    wc1=2*pi*frc1;
    wp1=tan((wc1*T)/2);

    wc2=2*pi*frc2;
    wp2=tan((wc2*T)/2);
    wo2=wp1*wp2;
    W=wp2-wp1;


    if tipo == 1
        %Pasa Bajas
        b=[wp1^2 2*wp1^2 wp1^2];
        a=[1+wp1*sqrt(2)+wp1^2 -2+2*wp1^2 1-wp1*sqrt(2)+wp1^2];
        B=b/a(1)
        A=a/a(1)

    elseif tipo == 2
        %Pasa Altas
        b=[1 -2 1];
        a=[1+wp1*sqrt(2)+wp1^2 -2+2*wp1^2 1-wp1*sqrt(2)+wp1^2];
        B=b/a(1)
        A=a/a(1)

    elseif tipo == 3
        %Pasa Banda
        C=W*sqrt(2);
        D=(2*wo2)+W^2;
        E=wo2*W*sqrt(2);
        F=wo2^2;
        b=[W^2 0 -2*W^2 0 W^2];
        a=[1+C+D+E+F -4-(2*C)+(2*E)+(4*F) 6-(2*D)+(6*F) -4+(2*C)-(2*E)+(4*F) 1-C+D-E+F];
        B=b/a(1)
        A=a/a(1)

    elseif tipo == 4
        b1=2*wo2;
        b2=wo2^2;
        a1=W*sqrt(2);
        a2=W^2+(2*wo2);
        a3=W*wo2*sqrt(2);
        a4=wo2^2;
        b=[1+b1+b2 -4+(4*b2) 6-(2*b1)+(6*b2) -4+(4*b2) 1+b1+b2];
        a=[1+a1+a2+a3+a4 -4-(2*a1)+(2*a3)+(4*a4) 6-(2*a2)+(6*a4) -4+(2*a1)-(2*a3)+(4*a4) 1-a1+a2-a3+a4];
        B=b/a(1)
        A=a/a(1)
    end
    freqz(B,A,1000,fs)
    save A.mat A
    save B.mat B
end




