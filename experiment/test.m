K=12;
M=50;
N=100;

A=randn(M,N);
x=randn(N,1);
kk=randperm(N);
x(kk(1:N-K))=0;
y=A*x;
x_r=Mallat(y,A,K);
t=randn(N,1);
Y=[x, x_r];
stem(Y)