clc;
fs=8000; %%sampling frequency
fp=1500; %%pass band edge frequency
fst=2000;%%stop band edge frequency
wp=(2*pi*fp)/fs;
ws=(2*pi*fst)/fs;
twn=(ws-wp)/pi;

wc=wp+twn*pi/2;

N=ceil(8/twn);
%%To design type I FIR filter , taps=odd or order=even
if(mod(N,2)==0)
N=N+1;
end
alpha=(N-1)/2;
er=0.001;
for n=0:1:N-1
hd(:,n+1)=(sin(wc*(n-alpha+er)))./(pi*(n-alpha+er));
end
%disp(hd)
figure;
whm=hamming(N);%%hamming window
disp('Hammind window coeff');
disp(whm);
stem(whm);
title('Hamming window');
hn=hd.*whm';
[H,f]=freqz(hn,1,1000,fs);
H_mag=20*log10(abs(H));
figure;
plot(f,H_mag);
xlabel('Normalized frequency');
ylabel('Magnitude');
disp('FIR Filter coeff hn');
disp(hn);