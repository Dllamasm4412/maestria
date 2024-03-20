x=(-1:2)';%vector de razgos
t=[-6.6,-2.5,2.75,7.6]';%vector de targets
A=[ones(4,1),x];
[W0,W1]=meshgrid(-10:10);
W=[W0(:)';W1(:)'];
Errores=(A*W-repmat(t,1,prod(size(W0))));
J=dot(Errores,Errores);
J=reshape(J,size(W0));
figure(1);
surf(W0,W1,J);
xlabel('w0'),ylabel('w1'),zlabel('J');
w=A\t;
hold on;
plot(w(1),w(2),'rx');
hold off;
figure(2)
title("Gradiente de la funcion de costo");
quiver(W0,W1,(8*W1+16*W0-5)/2,(120*W1+40*W0-491)/10);
xlabel('W0'),ylabel('W1')
