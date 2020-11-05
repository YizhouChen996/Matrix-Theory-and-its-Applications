K=8;
M=50;
N=100;
A=randn(M,N);
y=randn(M,1);
x = Mallat(y,A,K);
disp(x');