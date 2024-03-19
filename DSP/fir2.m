bwm = fir1(41,0.785, 'low');
freqz(bwm,1,1000,1000)
save bwm.mat bwm
bwm2 = fir1(41,0.785, 'high');
freqz(bwm2,1,1000,1000)
save bwm2.mat bwm2
% bwm2 = fir1(41,0.15zzz707, 'low');
% freqz(bwm2,1,1000,500)
% save bwm2.mat bwm2
bwm3 = fir1(41,0.785, 'low');
freqz(bwm3,1,1000,500)
save bwm3.mat bwm3
bwm4 = fir1(41,0.785, 'high');
freqz(bwm4,1,1000,500)
save bwm4.mat bwm4
bwm5 = fir1(41,0.785, 'low');
freqz(bwm5,1,1000,250)
save bwm5.mat bwm3
bwm6 = fir1(41,0.785, 'high');
freqz(bwm4,1,1000,250)
save bwm6.mat bwm4
bwm7 = fir1(41,0.785, 'low');
freqz(bwm7,1,1000,125)
save bwm5.mat bwm3
bwm8 = fir1(41,0.785, 'high');
freqz(bwm8,1,1000,125)
save bwm6.mat bwm4

