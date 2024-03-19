%%Filtro IIR
% Pasa bandas
b=[1 0 -1];
a=[1 0 0.8776];

freqz(b,a,1000,500)
%% Pasa bajas metodo z bilineal


b=[0.5902 -1.1809 0.5902];
a=[1 -1.0048 0.3561];
freqz(b,a,1000,1280)
%%
%%Pasa altas 
b1= [-1.041 0.53];
a1 = [1  -1.038 0.3252];
freqz(b1,a1,1000,1280)
%%
fc = 150;
fs = 1000;

[b,a] = butter(2,fc/(fs/2));
freqz(b,a)