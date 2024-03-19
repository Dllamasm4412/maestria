[x,Fs] = audioread('Prueba.wav');
 sound(x, Fs);
Y = fft(x);                  
% T = 1/Fs; 
% Sampling period       
l=length(x);
L = length(Y);             % Length of signal
P3= abs(Y);
 P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
figure(1)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

re= zeros(l,1);
 for i=10:1:18
     if (P3(i)>10)
         re(i)= Y(i); 
     end
 end
 
  for i=18:405
     if (P3(i)>10)
         re(i)= Y(i); 
     end 
  end
 
  
  for i=406:200000
     if (P3(i) > 10)
         re(i)= Y(i); 
     end
  end
 
  
  
  s=abs(ifft(re));
  prompt = 'Presione s' ;
  si=input(prompt);
  
  if si == 1
  sound(s,Fs)
  end