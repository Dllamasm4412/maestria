%Tarea Inteligencia Artificial

load('tresgausianasMat.mat');
datos = [data c]
[ejemplos, entradas] = size (datos)
nval=round(0.2*ejemplos) %Numero de datoa de evaluaciones
nentrena=ejemplos -nval  %Numero de datos de entrenamiento
indices =randperm(ejemplos);
indentrena=indices(1:nval)
indentrena=indices(1:nentrena)
indval=indices (nentrena+1:end)
Xentrena=datos(indentrena ,:)
Xval=datos(indval ,:)
C1ent=Xentrena(Xentrena (:,3)==1,1:2)
C2ent=Xentrena(Xentrena (:,4)==1,1:2)
C3ent=Xentrena(Xentrena (:,5)==1,1:2)
C1val=Xval(Xval (:,3)==1,1:2)
C2val=Xval(Xval (:,4)==1,1:2)
C3val=Xval(Xval (:,5)==1,1:2)

mu1=mean(C1ent ) %calcula los promedios y matrices de covarianza
S1=cov(C1ent )   %de cada clase
neC1=size(C1ent ,1)
mu2=mean(C2ent )
S2=cov(C2ent )
neC2=size(C2ent ,1)
mu3=mean(C3ent )
S3=cov(C3ent )
neC3=size(C3ent ,1)

pC1=neC1/(neC1+neC2+neC3) %calcula las prevalencias de cada clase
pC2=neC2/(neC1+neC2+neC3)
pC3=neC3/(neC1+neC2+neC3)
pxC1=mvnpdf (Xval(:,1:2),mu1,S1); %Probabilidades previas en los datos de
pxC2=mvnpdf (Xval(:,1:2),mu2,S2); %validacion
pxC3=mvnpdf (Xval(:,1:2),mu3,S3);
pC1x=(pxC1*pC1)./(pxC1*pC1+pxC2*pC2+pxC3*pC3); %robabilidades posteriores
pC2x=(pxC2*pC2)./(pxC1*pC1+pxC2*pC2+pxC3*pC3);
pC3x=(pxC3*pC3)./(pxC1*pC1+pxC2*pC2+pxC3*pC3);
[pC1x pC2x pC3x Xval(:,3:5)] %muestra las posteriores junto a los targets para
                             %comparacion
                             
%calcula el porcentaje de acierto
[~,clase]=max(Xval(:,3:5),[],2)
[~,prediccion]=max([pC1x pC2x pC3x],[],2)
acierto=sum(prediccion==clase)/nval*100