%aproxima un conjunto de datos con un polinomio de grado m

%lee los datos del archivo
load seno_ruido.mat

%grado del polinomio de aproximacion
m=9;

%parametro de regularizacion
lambda=1;

n=length(x);
%Construye la matriz de disenio 
A=zeros(n,m+1);
for indice=1:m+1
  A(:,indice)=x.^(indice-1);
end
%calcula los pesos de los polinomios
w=[A; lambda* eye(m+1)]\[entrenamiento;zeros(m+1,1)];
disp('pesos');
disp(w);

errores=A*w-entrenamiento;
fprintf('Error rms entrenamiento=%f\n',sqrt(dot(errores,errores)/n));

errores=A*w-validacion;
fprintf('Error rms validacion=%f\n',sqrt(dot(errores,errores)/n));

%grafica el polinomio resultante
xg=linspace(0,1,50)';
%Construye la matriz de potencias de xg 
Ag=zeros(50,m+1);
for indice=1:m+1
  Ag(:,indice)=xg.^(indice-1);
end

plot(x,entrenamiento,'ob','linewidth',2,x,validacion,'dr','linewidth',2,xg,Ag*w,'-g','linewidth',2,xg,sin(2*pi*xg),'-c','linewidth',2);
legend('entrenamiento','validacion','y(x)','sin(x)');