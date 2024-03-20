%kernel
load('dosespiralesML.mat');
X0=x(:,y==0)';
X1=x(:,y==1)';
plot(X0(:,1),X0(:,2), 'rx', X1(:,1), X1(:,2),'bo')
