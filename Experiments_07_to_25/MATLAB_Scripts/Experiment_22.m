% Experiment 22: Acquisition and digital signal processing of ECG and EMG signals
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=500; t=(0:1/Fs:10)'; ecg=0.8*sin(2*pi*1.2*t)+0.1*sin(2*pi*50*t)+0.03*randn(size(t)); emg=0.25*randn(size(t))+0.12*sin(2*pi*70*t); [b,a]=butter(3,[0.5 40]/(Fs/2),'bandpass'); ecgf=filtfilt(b,a,ecg); [be,ae]=butter(3,[20 150]/(Fs/2),'bandpass'); emgf=filtfilt(be,ae,emg);
figure; tiledlayout(2,1); nexttile; plot(t,ecg); hold on; plot(t,ecgf); grid on; legend('Raw ECG','Filtered'); nexttile; plot(t,emg); hold on; plot(t,emgf); grid on; legend('Raw EMG','Filtered'); xlabel('Time (s)');
