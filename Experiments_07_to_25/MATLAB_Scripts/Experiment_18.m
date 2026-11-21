% Experiment 18: FIR and IIR digital filters for real-time audio noise reduction
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=16000; t=(0:1/Fs:0.3)'; clean=sin(2*pi*500*t); noisy=clean+0.35*randn(size(t)); bf=fir1(60,1000/(Fs/2)); [bi,ai]=butter(4,1000/(Fs/2));
yf=filter(bf,1,noisy); yi=filter(bi,ai,noisy);
figure; plot(t,noisy,'Color',[.75 .75 .75]); hold on; plot(t,yf); plot(t,yi); grid on; legend('Noisy','FIR','IIR'); title('Audio noise reduction comparison'); xlabel('Time (s)');
