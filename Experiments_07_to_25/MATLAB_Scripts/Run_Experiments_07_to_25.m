% Run Experiments 7 through 25 in numeric order and save each output figure.
close all; clc; rng(7);
runStatus=cell(19,2);
for experimentNumber=7:25
    scriptName=sprintf('Experiment_%02d.m',experimentNumber);
    try
        run(scriptName);
        runStatus{experimentNumber-6,1}=scriptName;
        runStatus{experimentNumber-6,2}='PASS';
    catch ME
        runStatus{experimentNumber-6,1}=scriptName;
        runStatus{experimentNumber-6,2}=['FAIL: ' ME.message];
    end
end
disp(runStatus);
