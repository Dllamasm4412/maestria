%aproxima un conjunto de datos con un polinomio de grado m

%lee los datos del archivo
%load  seno_ruido.mat 
 x = [1.0 1.1 1.3 1.5 1.0 2.1];
%grado del polinomio de aproximacion
m=9;
n=length(x);
%Construye la matriz de disenio 
A=zeros(n,m+1);
for indice=1:m+1
  A(:,indice)=x.^(indice-1);
end
%calcula los pesos de los polinomios
w=A\entrenamiento;
disp('pesos');
disp(w);

errores=A*w-entrenamiento;
fprintf('Error rms entrenamiento=%f\n',sqrt(dot(errores,errores)/numel(errores)));

errores=A*w-validacion;
fprintf('Error rms validacion=%f\n',sqrt(dot(errores,errores)/numel(errores)));

%grafica el polinomio resultante
xg=linspace(0,1,50)';
%Construye la matriz de potencias de xg 
Ag=zeros(50,m+1);
for indice=1:m+1
  Ag(:,indice)=xg.^(indice-1);
end

plot(x,entrenamiento,'ob',x,validacion,'dr',xg,Ag*w,'-g',xg,sin(2*pi*xg),'-c');
legend('entrenamiento','validacion','y(x)','sin(x)');
