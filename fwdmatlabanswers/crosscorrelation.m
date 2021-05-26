clc; %clears the console window
clear all;%deletes the user defined variable in variable browser
close all;%close the figure window
%% Main Program
x=input('Enter the 1st seq:');
nx=input('Enter the time index seq:');
y=input('Enter the 2nd seq:');
ny=input('Enter the time index seq:');
[rxy,nrxy]=findconv(x,nx,flip(y),-flip(ny));
[ryx,nryx]=findconv(y,ny,flip(x),-flip(nx));
disp('rxy=');
disp(rxy);
disp(nrxy);
disp('ryx=');
disp(ryx);
disp(nryx);
if (rxy==flip(ryx))
disp('Rxy(lag)=Ryx(-lag) satisfied');
else
disp('Rxy(lag)=Ryx(-lag) not satisfied');
end
figure;
subplot(3,1,1);
stem(nx,x);
xlabel('Time');
ylabel('Amplitude');
title('1st seq');
subplot(3,1,2);
stem(ny,y);
xlabel('Time');
ylabel('Amplitude');
title('2nd seq');
subplot(3,1,3);
stem(ny,y);
disp(y);
disp(ny);
xlabel('Time');
ylabel('Amplitude');
title('cross correlation convolution');
%%function
function [y,ny]=findconv(x,nx,h,nh)
nyb=nx(1)+nh(1);
nye=nx(length(nx))+nh(length(nh));
ny=nyb:nye;28
y=conv(x,h);
end