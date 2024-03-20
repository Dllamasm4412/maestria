
%aproxima un conjunto de datos con una combinacion lineal de m
%gausianas
%lee los datos del archivo
load  senoruidoML.mat

%Numero de gausianas en la aproximacion
m=6;
%establese las posiciones de las gausianas
mus=linspace(0,1,m);
%establece la desviacion estandar en el ancho del intervalo entre m
s=0.8/m;

n=length(x);
%Construye la matriz de disenio 
A=[ones(n,1) zeros(n,m)];
for indice=1:m
  A(:,indice+1)=exp(-((x-mus(indice)).^2)./(2*s^2));
end
%calcula los pesos de los polinomios
w=A\entrenamiento;
disp('pesos');
disp(w);

errores=A*w-entrenamiento;
fprintf('Error rms entrenamiento=%f\n',sqrt(dot(errores,errores)/n));

errores=A*w-validacion;
fprintf('Error rms validacion=%f\n',sqrt(dot(errores,errores)/n));

%grafica el polinomio resultante
xg=linspace(0,1,50)';
%Construye la matriz de disegno de xg 
Ag=[ones(50,1) zeros(50,m)];
for indice=1:m
  Ag(:,indice+1)=exp(-((xg-mus(indice)).^2)./(2*s^2));
end

figure(1);
plot(x,entrenamiento,'ob',x,validacion,'dr',xg,Ag*w,'-g',xg,sin(2*pi*xg),'-c');
legend('entrenamiento','validacion','y(x)','sin(x)');

figure(2);
plot(xg,Ag);
title('Funciones base originales');

figure(3);
plot(xg,Ag.*repmat(w',50,1));
title('Funciones base escaladas');
