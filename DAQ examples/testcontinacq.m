% testcontinacq.m
% Test of Data Acquisition Toolbox   22/5/2016
% using USB-6229

% background acquisition:
s = daq.createSession('ni');
s.addAnalogInputChannel('Dev1','ai0','Voltage');
s.addAnalogOutputChannel('Dev1','ao0','Voltage');
s.Rate = 10000; % 20 kHz 
s.IsContinuous  = true;


% queue the output data:
% 1 sec: 
outputData = zeros(s.Rate,1); % sin(linspace(0,2*pi,1000))';
outputData(round(0.5*s.Rate):round(0.6*s.Rate)) = 1;   % a square pulse, 500 to 600 ms

% queue some output data to start with:
s.queueOutputData(outputData);

lhi = addlistener(s, 'DataAvailable', @plotData);  % see seperate function definition for plotData
lho = addlistener(s, 'DataRequired',...
    @(src,event) src.queueOutputData(outputData));

startBackground(s);

% then call s.stop(), delete(lhi), and delete(lho)  when all finished..