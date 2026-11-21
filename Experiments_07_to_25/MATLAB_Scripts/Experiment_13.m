% Experiment 13: Polyphase implementation of decimation and interpolation filters
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
x=randn(1,512); h=fir1(31,0.22); M=4; y0=filter(h,1,x); yRef=y0(1:M:end);
% Equivalent phase-wise filtering followed by aligned output selection
E=cell(1,M); for r=0:M-1, E{r+1}=h(r+1:M:end); end
yPoly=zeros(size(yRef)); for k=1:numel(yRef), n0=(k-1)*M; acc=0; for r=0:M-1, for ell=0:numel(E{r+1})-1, xi=n0-(r+ell*M)+1; if xi>=1, acc=acc+E{r+1}(ell+1)*x(xi); end, end, end, yPoly(k)=acc; end
figure; plot(yRef,'k'); hold on; plot(yPoly,'--'); grid on; legend('Direct reference','Polyphase'); title('Decimator output comparison'); xlabel('Output sample');
disp('Polyphase branches:'); disp(E);
