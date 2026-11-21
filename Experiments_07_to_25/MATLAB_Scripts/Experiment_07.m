% Experiment 7: FIR design using Parks McClellan and frequency sampling
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=8000; N=40; % example sampling rate/order
f=[0 0.2 0.28 1]; a=[1 1 0 0];
b1=firpm(N,f,a); b2=fir2(N, f, a);
[H1,w]=freqz(b1,1,1024); H2=freqz(b2,1,1024);
figure; plot(w/pi,20*log10(abs(H1)+eps),'LineWidth',1.3); hold on
plot(w/pi,20*log10(abs(H2)+eps),'--','LineWidth',1.3); grid on
xlabel('Normalized frequency'); ylabel('Magnitude (dB)'); legend('Parks-McClellan','Frequency sampling'); title('Experiment 7 FIR designs');
