clear all
clc
x=[0.5,0.5];
D= rand(10,2);
Dif=repmat(x,10,1) - D;
f=dot(Dif,Dif,2)
[~,indices]=sort(f)
D(1,1)^2 + D(1,2)^2;