% Experiment 9: Uniform quantization and finite word length effects
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
n=0:255; x=0.9*sin(2*pi*0.035*n)+0.08*sin(2*pi*0.19*n); bits=[4 8 12];
figure; tiledlayout(2,1); nexttile; plot(n,x,'k'); hold on
sqnr=zeros(size(bits)); for k=1:numel(bits), L=2^(bits(k)-1); d=1/L; xq=d*round(x/d); plot(n,xq); e=x-xq; sqnr(k)=10*log10(mean(x.^2)/mean(e.^2)); end
grid on; legend('Original','4 bit','8 bit','12 bit'); title('Uniform rounding quantization'); nexttile; stem(n,x-d*round(x/d),'.'); grid on; title('Quantization error'); xlabel('Sample');
disp(table(bits(:),sqnr(:),'VariableNames',{'Bits','SQNR_dB'}));
