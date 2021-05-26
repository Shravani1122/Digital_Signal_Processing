%%Program to find dft
clc;
clear all;
close all;
%%input sequence
xn=input('enter the input sequence: ');
N=input('enter the number of points: ');
Xk=calcdft(xn,N);
disp('DFT X(K)= ');
disp(Xk);
%%magnitude of dft
magXk=abs(Xk);
%%phase of dft
phaseXk=angle(Xk);
k=0:N-1;
subplot(2,1,1);
stem(k,magXk);
title('fft sequence');
xlabel('frequency');
ylabel('magnitude');
subplot(2,1,2);
stem(k,phaseXk);
title('phase of fft sequence');
xlabel('frequency');
ylabel('phase');
function [Xk]=calcdft(xn, N)
L=length(xn);
if(N<L)
error('N must be >=L');
end
x1=[xn zeros(1,N-L)];
for k=0:1:N-1;
for n=0:1:N-1;
p=exp(-i*2*pi*n*k/N);
T(k+1,n+1)=p;
end
end
disp('Transformation Matrix for dft')
disp(T);
Xk=T*x1.';
end