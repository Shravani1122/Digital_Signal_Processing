%y(n)-0.25y(n-1)-0.125y(n-2)=x(n)+0.5x(n-1)
%x(n)=u(n)-u(n-2)
%y(-1)=1 and y(-2)=2 , (enter the values as [2 1])
clc; %clears the console window
clear all;%deletes the user defined variable in variable browser
close all;%close the figure window
%a=[1 -0.25 -0.125]
%b=[1 0.5]11
b=input('Enter the coefficients of x: ');
a=input('Enter the coefficients of y: ');
M=length(b)-1;
N=length(a)-1;
IC=input('Enter the initial conditions for y: ');
%Initial conditions for transposed direct-form II filter 
ic=filtic(b,a,flip(IC));
n=[0:20];%number of terms
%x[n]=u[n]-u[n-2]
x=[(n>=0)]-[(n>=2)];
y=filter(b, a, x, ic);
 
subplot(211);
stem(n,x);
title('input sequence x[n]');
xlabel('n');
ylabel('x[n]');
subplot(212);
stem(n,y);
 
title('output sequence y[n]');
xlabel('n');
ylabel('y[n]');
disp('y[n]=');
disp(y)