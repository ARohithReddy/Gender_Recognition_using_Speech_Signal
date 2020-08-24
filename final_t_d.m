clear;
clc;

filename= 'wav\female\arctic_a0040.wav';

[y,Fs]= audioread(filename);
N=length(y);

sound(y,Fs);

%plot the input signal
t = linspace(0,N/Fs,N);
figure(1);
plot(t,y);
title('vioce signal');

%freq response of filters
% fr_m=freqz(male_f);
% fr_f=freqz(female_f);
% 
% w=Fs*linspace(0,1,length(fr_f));
% 
% figure(2)
% subplot(2,1,1)
% plot(w,abs(fr_m))
% title('Band pass filter(male)')
% axis([0 8000 -1 2])
% subplot(2,1,2)
% plot(w,abs(fr_f))
% title('Band pass filter(female)')
% axis([0 8000 -1 2])

%response after passing through band pass filters

ym=filter(male_f,y);

yf=filter(female_f,y);

%ploting time domine signals after passing through BPF filters

figure(3);
subplot(2,1,1)
plot(t,ym)
title('Signal after passing through BPF filter(male)')
subplot(2,1,2)
plot(t,yf)
title('Signal after passing through BPF filter(female)')

%calculation of energy 

ym1=ym/max(ym);
yf1=yf/max(yf);

Em=sum(abs(ym1));
Ef=sum(abs(yf1));

%display the result

if (Em>Ef)
    disp('THE VOICE IS OF A MALE');
else
    disp('THE VOICE IS OF A FEMALE');
end
