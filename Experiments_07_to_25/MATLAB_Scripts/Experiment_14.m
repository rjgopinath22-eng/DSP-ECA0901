% Experiment 14: 5G oriented decimation and interpolation for mmWave signal processing
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=1e6; n=0:4095; x=exp(1j*2*pi*80e3*n/Fs)+0.5*exp(1j*2*pi*170e3*n/Fs); M=2; L=2;
h=fir1(80,0.42); xd=filter(h,1,x); xd=xd(1:M:end); xu=zeros(1,numel(x)*L); xu(1:L:end)=x; xu=filter(h*L,1,xu);
figure; tiledlayout(2,1); nexttile; pwelch(x,[],[],[],Fs,'centered'); title('Representative complex baseband spectrum'); nexttile; pwelch(xd,[],[],[],Fs/M,'centered'); title('After decimation');
