%% Exponenciales
clear all; 
% 
% x = [4.0 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8];
% y = [102.56 113.18 130.11 142.05 167.53 195.14 224.87 256.73 299.50];
x= [0.2 0.3 0.6 0.9 1.1 1.3 1.4 1.6];
y = [0.050446 0.098426 0.33277 0.72660 1.0972 1.5697 1.8487 2.5015];
 
 polinomio=polyfit(x,log(y),1)
 xp1= x;
 B1=polinomio(1);
 A1= exp(polinomio(2));
n = length(x);
for i=1:n
 yp1(i)=A1*(exp(B1*x(i)));
end 
% 
plot(x,y,'o'), hold on, 
plot(x,yp1,'red')
   grid on;
   Error = rms(yp1-y)
%%
%Potenciales
%  x = [4.0 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8 7.1];
%  y = [102.56 113.18 130.11 142.05 167.53 195.14 224.87 256.73 299.50 326.72];
x= [0.2 0.3 0.6 0.9 1.1 1.3 1.4 1.6];
y = [0.050446 0.098426 0.33277 0.72660 1.0972 1.5697 1.8487 2.5015];
polinom=polyfit(log(x),log(y),1);
%xp= 0.01:0.01:10;
A=exp(polinom(2))
B=polinom(1)
yp=A*x.^B;
Error = rms(yp-y)
plot(x,y,'o'), hold on, plot(x,yp,'red'), grid on;