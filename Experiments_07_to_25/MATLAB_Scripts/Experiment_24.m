% Experiment 24: OFDM channel estimation using LS and MMSE
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
N=64; pilots=1:4:N; H=0.8*exp(-1j*2*pi*(0:N-1)/N*3)+0.2; noiseVar=0.04; X=ones(1,N); Y=X.*H+sqrt(noiseVar/2)*(randn(1,N)+1j*randn(1,N)); Hls=Y(pilots)./X(pilots); Hls=interp1(pilots,Hls,1:N,'linear','extrap'); Hmmse=Hls.*(abs(Hls).^2./(abs(Hls).^2+noiseVar));
figure; plot(0:N-1,abs(H),'k','LineWidth',1.4); hold on; plot(0:N-1,abs(Hls),'--'); plot(0:N-1,abs(Hmmse),':'); grid on; legend('True','LS','MMSE'); xlabel('Subcarrier'); ylabel('|H|'); title('OFDM channel estimation');
