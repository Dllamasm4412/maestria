%load b.mat
load b.mat
fm= 256;
t1= 0: 1/fm:0.4;
t2 = 0.4: 1/fm: 0.8;
t3= 0.8:  1/fm: 1.2;
tf= [t1 t2 t3];

%5 10 60 
a= sin(2*pi*t1*5);
b= sin(2*pi*t2*50);
o= sin(2*pi*t3*70);
sig = [a b o];
%plot(tf, sig)
%grid on;
N= length(sig);
k = 15;
z=[zeros(1,k)];
sal = [z sig];
y= zeros(1,N);
for n=1:N
    for k= 1:15
     y(n)=y(n)+ (b(k)*sal(((n+15)-k)));
    end 
end 
plot(tf, y)
grid on;