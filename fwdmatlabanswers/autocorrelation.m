clc; %clears the console window
clear all;%deletes the user defined variable in variable browser
close all;%close the figure window
 
%% Main Program
x=input('enter the sequence x= ');
nx=input('enter the index for sequence nx= ');
[rxx,nrxx]=findconv(x,nx,flip(x),-flip(nx));
%using inbuilt function
%[rxx,nrxx]= xcorr(x);
E=sum(x.^2);
disp('energy');
disp(E);
disp(rxx);
disp(nrxx);
if(rxx(ceil(length(rxx)/2))==max(rxx))
disp('Rxx(0) is the maximum value; proved');
else
disp('Rxx(0) is the maximum value; not proved');
end;
if (rxx(ceil(length(rxx)/2))==E)
disp('Rxx(0)gives energy; proved');
else
disp('Rxx(0)gives energy; not proved');
end
if (rxx==flip(rxx))
disp('symmetric property satisfied');
else
disp('symmetric property not satisfied');
end
subplot(2,1,1);
stem(nx,x);
xlabel('n');
ylabel('x[n]');26
subplot(2,1,2);
stem(nrxx,rxx);
xlabel('l');
ylabel('r[l]');
title('auto correlation');
%%function
function [y,ny]=findconv(x,nx,h,nh)
nyb=nx(1)+nh(1);
nye=nx(length(nx))+nh(length(nh));
ny=nyb:nye;
y=conv(x,h);
end
