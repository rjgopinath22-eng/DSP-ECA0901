% Experiment 17: Real-time DSP algorithm implementation and signal visualization using CCS
% Standalone MATLAB script. Uses example parameters because the screenshots omit
% the input parameter tables. Change the marked values to your lab values.
clear; close all; clc; rng(7);
Fs=8000; t=(0:255)/Fs; generated=sin(2*pi*440*t); acquired=generated+0.02*randn(size(t)); % replace with codec buffer for hardware
figure; plot(t,generated); hold on; plot(t,acquired); grid on; legend('Generated','Acquired / simulated'); xlabel('Time (s)'); title('CCS signal visualization example');
