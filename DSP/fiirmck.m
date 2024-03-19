% rs = 40;          % Stopband ripple in dB
 fs = 256;        % Sampling frequency
% f = [0 20];    % Cutoff frequencies
% a = [0 1];        % Desired amplitudes
% dev = [(10^(rp/20)-1)/(10^(rp/20)+1) 10^(-rs/20)]; 
% [n,fo,ao,w] = firpmord(f,a,dev,fs);
% b1 = firpm(n,fo,ao,w);
% freqz(b1,1,1000,fs)
% % 
% [n,fo,ao,w] = firpmord([0 20],[0 1],[0.001 0.01],256);
% b = firpm(n,fo,ao,w);


[n,fo,ao,w] = firpmord([0 10],[1 0],[0.001 0.1],256);
b1 = firpm(n,fo,ao,w);
freqz(b1,1,1000,fs)
save b1.mat b1