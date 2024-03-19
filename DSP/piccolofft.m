clear all;
clc;



X= [1 10 16 4 5 6 7 8]
xtp0=X(1)+X(5)+X(3)+X(7)+ X(2)+X(6)+ X(4)+X(8);

% xtp4=X(1)-X(5)+j*X(3)-j*X(7)+(0.7071 + 0.7071*j) *(X(2)-X(6)+j*X(4)-j*X(8));
xtp4r= X(1)-X(5)+.7071*X(2)-.7071*X(6)-.7071*X(4)+.7071*X(8);
xtp4i=X(3)-X(7)+.7071*X(4)-.7071*X(8)+.7071*X(2)-.7071*X(6);
xtp4f= sqrt(xtp4r^2 +xtp4i^2);
%xtp2=X(1)+X(5)-X(3)-X(7)+ j*(X(2)+X(6)-X(4)-X(8));
xtp2r=X(1)+X(5)-X(3)-X(7);
xtp2i=X(2)+X(6)-X(4)-X(8);
xtp2f= sqrt(xtp2r^2 +xtp2i^2);

% xtp6=X(1)-X(5)-j*X(3)+j*X(7)+(-0.7071 + 0.7071*j)*(X(2)-X(6)-j*X(4)+j*X(8));
xtp6r=X(1)-X(5)-.7071*X(2)+.7071*X(6)+.7071*X(4)-.7071*X(8);
xtp6i=-X(3)+X(7)+.7071*X(4)-.7071*X(8)+.7071*X(2)-.7071*X(6);
xtp6f= sqrt(xtp6r^2 +1*xtp6i^2);

xtp1=X(1)+X(5)+ X(3)+X(7)- X(2)-X(6)- X(4)-X(8);

%xtp5=X(1)-X(5)+j*X(3)-j*X(7)+(-0.7071 - 0.7071*j)* (X(2)-X(6)+j*X(4)-j*X(8));
xtp5r=X(1)-X(5)-.7071*X(2)+.7071*X(6)+.7071*X(4)-.7071*X(8);
xtp5i=X(3)-X(7)-.7071*X(4)+.7071*X(8)-.7071*X(2)+.7071*X(6);
xtp5f= sqrt(xtp5r^2 +1*xtp5i^2);

%xtp3=X(1)+X(5)- X(3)-X(5)- j*(X(2)+X(6)- X(4)-X(8));
xtp3r=X(1)+X(5)- X(3)-X(7);
xtp3i=X(2)+X(6)- X(4)-X(8);
xtp3f= sqrt(xtp3r^2 +1*xtp3i^2);

% xtp7=X(1)-X(5)-j*X(3)+j*X(7)+(0.7071 - 0.7071*j)*(X(2)-X(6)-j*X(4)+j*X(8));
xtp7r=X(1)-X(5)+0.7071*X(2)-0.7071*X(6)-0.7071*X(4)+0.7071*X(8);
xtp7i=-X(3)+X(7)-0.7071*X(4)+0.7071*X(8)-0.7071*X(2)+0.7071*X(6);
xtp7f= sqrt(xtp7r^2+1*xtp7i^2);



%%%%%%%%%%%%%%old version
% xp0= X(1)+X(5); xp4= X(1)-X(5); xp2= X(3)+X(7); xp6=X(3)-X(7);
% xp1=X(2)+X(6); xp5=X(2)-X(6); xp3=X(4)+X(8); xp7=X(4)-X(8);
%
% xdp0= xp0+xp2; xdp4=xp4+j*xp6; xdp2= xp0-xp2; xdp6=xp4-j*xp6;
% xdp1=xp1+xp3; xdp5=xp5+j*xp7; xdp3=xp1-xp3; xdp7=xp5-j*xp7;
%
% xtp0= xdp0+xdp1; xtp4=xdp4+W1*xdp5; xtp2= xdp2+W2*xdp3; xtp6=xdp6+W3*xdp7;
% xtp1=xdp0-xdp1; xtp5=xdp4-W1*xdp5; xtp3=xdp2-W2*xdp3; xtp7=xdp6-W3*xdp7;



xtp0f=xtp0;
%xtp4f=abs(xtp4);
%xtp2f=abs(xtp2);
%xtp6f=abs(xtp6);
xtp1f=sqrt(xtp1^2);
%xtp5f=abs(xtp5);
%xtp3f=abs(xtp3);
%xtp7f=abs(xtp7);



z= [xtp0 xtp4f xtp2f xtp6f xtp1f xtp5f xtp3f xtp7f]