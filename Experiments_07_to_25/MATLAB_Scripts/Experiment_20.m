% Experiment 20: LPC based speech analysis and vocoder implementation
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=8000; t=(0:1/Fs:0.4)'; x=filter(1,[1 -0.92],randn(size(t))); x=x/(max(abs(x))+eps)*0.8; p=12; a=lpc(x,p); residual=filter(a,1,x); y=filter(1,a,residual);
figure; subplot(2,1,1); plot(t,x); hold on; plot(t,y); grid on; legend('Original','LPC synthesis'); title('LPC vocoder example'); subplot(2,1,2); [P1,f]=periodogram(x,[],1024,Fs); [P2,~]=periodogram(y,[],1024,Fs); plot(f,10*log10(P1+eps)); hold on; plot(f,10*log10(P2+eps)); grid on; legend('Original','Reconstructed'); xlabel('Hz');
