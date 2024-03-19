clc
clear all;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=15;

phi=(-pi*(N-1))/N;

H=[1*exp(j*phi*0), 1*exp(j*phi*1), 0*exp(j*phi*2), 0*exp(j*phi*3), 0*exp(j*phi*4), 1*exp(j*phi*5) 1*exp(j*phi*6) 1*exp(j*phi*7) 1*exp(j*phi*8) 1*exp(-j*phi*6) 1*exp(-j*phi*5) 0*exp(-j*phi*4) 0*exp(-j*phi*3) 0*exp(-j*phi*2) 1*exp(-j*phi*1)];
h=ifft(H);

freqz(h, 1, 1000, 18e3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% clc
% clear all;
% close all;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% N=15;
% 
% phi=(-pi*(N-1))/N;
% 
% H=[0, 0, 1*exp(j*phi*2), 1*exp(j*phi*3), 0, 0, 0, 0, 0, 0, 0, 0, 1*exp(-j*phi*3) 1*exp(-j*phi*2) 0];
% h=ifft(H);
% 
% freqz(h, 1, 1000, 18e3);