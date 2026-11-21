% Experiment 16: Butterworth IIR filter for audio signal processing
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=16000; t=(0:1/Fs:0.25)'; x=sin(2*pi*400*t)+0.5*sin(2*pi*3500*t); [b,a]=butter(6,1200/(Fs/2),'low'); y=filter(b,a,x);
figure; subplot(2,1,1); plot(t,x); hold on; plot(t,y); grid on; legend('Input','Filtered'); xlabel('Time (s)'); title('Butterworth audio low-pass'); subplot(2,1,2); freqz(b,a,1024,Fs);
