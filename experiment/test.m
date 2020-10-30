K=1000;
M=15000;
N=23000;
A=randn(M,N);
y=randn(M,1);
x = Mallat(y,A,K);