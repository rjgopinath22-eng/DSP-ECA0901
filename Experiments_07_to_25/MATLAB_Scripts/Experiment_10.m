% Experiment 10: Coefficient and product quantization noise and limit cycle oscillations
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
b=[0.2 0.2]; a=[1 -0.9]; x=zeros(1,100); x(1)=0.5;
yIdeal=filter(b,a,x); q=1/128; yq=zeros(size(x)); yq(1)=round(0.2*x(1)/q)*q;
for k=2:numel(x), yq(k)=round((0.2*x(k)+0.2*x(k-1)+0.9*yq(k-1))/q)*q; end
figure; stem(0:99,yIdeal,'filled'); hold on; stairs(0:99,yq); grid on; legend('Floating point','Quantized arithmetic'); title('Zero input response / limit cycle example'); xlabel('Sample');
