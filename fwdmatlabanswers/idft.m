clc;
clear all;
close all;
%%input sequence
Xk=input('enter the input sequence');
xn=calcidft(Xk);
N=length(xn);
disp('x(n)=');
disp(xn);
n=0:N-1;
stem(n,xn);
title('ifft sequence');
xlabel('time');
ylabel('amplitude');
%%Xk should be row vector
function [xn]=calcidft(Xk)
N=length(Xk);
for k=0:1:N-1;
for n=0:1:N-1;
p=exp(i*2*pi*n*k/N);
IT(k+1,n+1)=p;
end
end
disp('Transformation Matrix for idft')
disp(IT);
xn=(IT*(Xk.'))./N;
end