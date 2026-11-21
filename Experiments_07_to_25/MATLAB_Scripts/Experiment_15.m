% Experiment 15: Finite word length effects and quantization noise using DSP starter kit
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
n=0:255; x=0.8*sin(2*pi*0.04*n); bits=8; q=2^(-(bits-1)); xq=q*round(x/q); e=x-xq; SQNR=10*log10(mean(x.^2)/mean(e.^2));
figure; tiledlayout(3,1); nexttile; plot(n,x); title('Original signal'); grid on; nexttile; stairs(n,xq); title('8-bit quantized signal'); grid on; nexttile; stem(n,e,'.'); title(sprintf('Error; SQNR = %.2f dB',SQNR)); grid on;
