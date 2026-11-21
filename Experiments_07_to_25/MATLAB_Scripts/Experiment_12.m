% Experiment 12: Decimation and interpolation in multirate signal processing
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=48000; n=0:2047; x=sin(2*pi*3000*n/Fs)+0.6*sin(2*pi*15000*n/Fs); M=4; L=3;
h=fir1(64,0.8/max(M,L)); yd=filter(h,1,x); yd=yd(1:M:end);
xu=zeros(1,numel(x)*L); xu(1:L:end)=x; yi=filter(h*L,1,xu);
figure; tiledlayout(2,2); nexttile; plot(x); title('Input'); grid on; nexttile; plot(yd); title('Decimated by 4'); grid on; nexttile; plot(yi); title('Interpolated by 3'); grid on; nexttile; pwelch(x,[],[],[],Fs); title('Input PSD');
