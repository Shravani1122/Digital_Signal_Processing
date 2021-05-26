%% Program
clc; % clears the command window 
clear all; %clears variables in workspace
close all; %close all fig windows
t=0:0.001:0.2; %analog time axis
f1=input ('Enter the input frequency1 = '); 
f2=input ('Enter the input frequency2 = '); 
xa=cos(2*pi*f1*t)+cos(2*pi*f2*t);
fm=max(f1,f2);
% For Right sampling fs=2*fm
% For Over sampling fs>2*fm so let fs=fm
% For Under sampling fs<2*fm so let fs=4*fm
fs=2*fm; %fs = sampling freequency
ts=1/fs; 
n=0:1:(0.2*fs);
xd=cos(2*pi*f1*(n*ts))+cos(2*pi*f2*(n*ts));
figure;
subplot(3,1,1);
plot(t,xa);
xlabel('t in s');
ylabel('amp');
title('Analog Signal and Discrete Signal');
hold on;
stem(n*ts,xd);
hold off;
legend('Continuous xa(t)','xd(n)');
%% Plot only Discrete signal 7
subplot(3,1,2);
stem(n,xd,'r');
xlabel('n samples');
ylabel('xd[n]');
title('Discrete Signal');
%% Reconstruction by using the formula:
% xr(t) = sum over n=0,...,N-1: x(nT)*sin(pi*(t-nT)/T)/(pi*(tnT)/T)
% Note that sin(pi*(t-nT)/T)/(pi*(t-nT)/T) = sinc((t-nT)/T)
% sinc(x) = sin(pi*x)/(pi*x) according to MATLAB
xr=xd*sinc((t-(n'*ts))/ts);
subplot(3,1,3);
plot(t,xr);
xlabel('t in s');
ylabel('xr(t)');
title('Right Sampling'); %or /Over Sampling/ Under Sampling
%%%%%%%%%%%%%%%%%%%%