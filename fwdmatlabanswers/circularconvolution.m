clc; %clears the console window
clear all;%deletes the user defined variable in variable browser
close all;%close the figure window
x= input('Enter x[n]: '); %read input x[n]
h= input('Enter h[n]: '); % read impulse response h[n]
N= input('Enter N: ');
l1=length(x);
l2=length(h);
x=[x zeros(1,(N-l1))]
h=[h zeros(1,(N-l2))]
%inbuilt function
%y=cconv(x,h,N);
%-----------------------------------------------------------
%y=Circular convolution of x[n] and h[n]
%note: in matlab index starts with 1 and not 0
for n=1:1:N
y(n)=0;
for k=1:1:N
y(n)=y(n)+x(k)*h(mod((n-k),N)+1);
end
end
%end
%-----------------------------------------------------------
disp('The circular convolution of two given sequence');
n=0:N-1;
figure;
subplot(3,1,1);
stem(n,x);
xlabel('Time');
ylabel('Amplitude');
title('1st sequence');
subplot(3,1,2);
stem(n,h);
xlabel('Time');
ylabel('Amplitude');
title('2nd sequence');
subplot(3,1,3);
stem(n,y);
xlabel('Time');
ylabel('Amplitude');
title('circular convolution');
disp(y);
disp(n);21
OUTPUT:
Enter x[n]: [1 2 3 4