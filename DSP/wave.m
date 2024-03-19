%%
%Wavelet
fm= 1000;
t1= 0: 1/fm:0.4;
t2 = 0.4: 1/fm: 0.8;
t3= 0.8:  1/fm: 1.2;
t4= 1.2:  1/fm: 1.6;
tf= [t1 t2 t3 t4];
% 
% %5 10 60 
a= sin(2*pi*t1*25);
b= sin(2*pi*t2*50);
c= sin(2*pi*t3*100);
o= sin(2*pi*t4*200);
sig = [a b c o];
save sig.mat sig
%plot(tf, sig)
% a1= conv(sig,bwm,'same') ;
% a2 = conv(sig,bwm2,'same') ;
% a3 = conv(a2,bwm3,'same') ;
% a4 = conv(sig,bwm4,'same') ;
% subplot(2,2,1)
% plot(tf, a1)
% subplot(2,2,2);
 %
% plot(tf, a3)
% subplot(2,2,3)
% plot(tf, a3)
% subplot(2,2,4)
% plot(tf, a4)
% 
% [phi,psi,xval] = wavefun('db4');
% subplot(211)
% %plot(xval,phi); title('Scaling Function');
% subplot(212)
% %plot(xval,psi); title('Wavelet Function')

[y,Fs] = audioread('Prueba.wav');
wname = 'haar';
[LoD,HiD,LoR,HiR] = wfilters(wname); 

% stem(LoD)
% title('Decomposition Lowpass Filter')
% subplot(2,2,2)
% stem(HiD)
% title('Decomposition Highpass Filter')
% subplot(2,2,3)
% stem(LoR)
% title('Reconstruction Lowpass Filter')
% subplot(2,2,4)
% stem(HiR)
% title('Reconstruction Highpass Filter')
% xlabel(['The four filters for ',wname])
tf = 0:1/Fs:8;
a1= conv( y,LoD, 'same');
d1 = conv(y,HiD,'same');
a11 = downsample(a1,2);
tf1 = downsample(tf,2);
a2= conv(a11,LoD, 'same');
d2= conv(a11, HiD, 'same');
a21 = downsample(a2,2);
tf21 = downsample(tf1,2);
a3 = conv(a21, LoD,'same');
d3 = conv(a21, HiD, 'same');
a31 = downsample(a3,2);
tf31 = downsample(tf21,2);
a4 = conv(a31, LoD,'same');
d4 = conv(a31, HiD, 'same');

a41 = downsample(a4,2);
tf41 = downsample(tf31, 2);
a5= conv(a41, LoD,'same');
d5 = conv(a41, HiD,'same');



%sound(S,Fs);

 
subplot(5,2,1)
plot(L,a1)
title('a1')
grid on
subplot(5,2,2)
plot(tf, d1)
title('d1')
grid on
subplot(5,2,3)
plot(tf1,a2)
title('a2')
grid on
subplot(5,2,4)
plot(tf1,d2)
title('d2')
grid on

subplot(5,2,5)
plot(tf21,a3)
title('a3')
grid on
subplot(5,2,6)
plot(tf21,d3)
title('d3')
grid on

subplot(5,2,7)
plot(tf31,a4)
title('a4')
grid on
subplot(5,2,8)
plot(tf31,d4)
title('d4')
grid on


subplot(5,2,9)
plot(tf41,a5)
title('a5')
grid on
subplot(5,2,10)
plot(tf41,d5)
title('d5')
grid on




