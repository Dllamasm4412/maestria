
[y,Fs] = audioread('Prueba.wav');
[c,l]=wavedec(y,5,'db5');
[cd1, cd2, cd3, cd4, cd5]=detcoef(c,l,[1,2,3,4,5]);
d1 = wrcoef('d',c,l,'db5',1);
d2 = wrcoef('d',c,l,'db5',2);
d3 = wrcoef('d',c,l,'db5',3);
d4 = wrcoef('d',c,l,'db5',4);
 d5 = wrcoef('d',c,l,'db5',5); 
sonido = d1+d2+d3+d4+d5;
sound(sonido,Fs)