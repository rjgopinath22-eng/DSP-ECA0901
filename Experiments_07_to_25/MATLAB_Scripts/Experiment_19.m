% Experiment 19: Spectral subtraction for speech noise reduction
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=16000; t=(0:1/Fs:1)'; clean=sin(2*pi*220*t).*(0.4+0.6*(sin(2*pi*3*t)>0)); noisy=clean+0.25*randn(size(t));
w=hann(256,'periodic'); [S,f,tt]=stft(noisy,Fs,'Window',w,'OverlapLength',192,'FFTLength',512);
noiseMag=mean(abs(S(:,1:10)),2); Sout=max(abs(S)-noiseMag,0.03*abs(S)).*exp(1j*angle(S)); enhanced=istft(Sout,Fs,'Window',w,'OverlapLength',192,'FFTLength',512);
figure; tiledlayout(2,1); nexttile; imagesc(tt,f,20*log10(abs(S)+eps)); axis xy; ylim([0 4000]); title('Noisy speech spectrogram'); nexttile; imagesc(tt,f,20*log10(abs(Sout)+eps)); axis xy; ylim([0 4000]); title('Spectral subtraction estimate');
