function [yin] = nimwavio_mx_dat(yout, dac, samplerate, adc)
%NIMWAVIO_MX_RTT Multiple waveform input/output for National Instruments
%NI-DAQmx - Version using Data Acquisition Toolbox.
%Plug-compatible with nimwavio_mx.   (c) Hugh Robinson, 2017
%Syntax: [YIN] = NIMWAVIO_MX_RTT(YOUT, DAC, OUTRATE, ADC, INRATE, NPOINTSIN, GAIN, TRIG, DEVICES)
% DAC and ADC can be a vector of channel numbers for multiple channels
% inrate and outrate need to be equal (both provided so that syntax matches
% original nimwavio_mx. 
% Jan 23 2019: npointsin is not necessary, determined by number of output
% points.
% Currently assumes only a single input and output channel
% Note: syntax is actually different from nimwavio_mx - this is just a
% prototype to test the concept
% trigger on  
% Feb 26 2019


s = daq.createSession('ni');
s.addAnalogInputChannel('Dev1',adc,'Voltage');
s.addAnalogOutputChannel('Dev1',dac,'Voltage');
addDigitalChannel(s,'Dev1','Port0/Line1:1','OutputOnly');    % Port 0, line 1 only.

s.Rate = samplerate;

% queue the output data:
digdata = zeros(length(yout),1);
digdata(1:10)=1;  % create pulse

queueOutputData(s,[yout' digdata]);  % Each channel needs to be a column vector


[yin] = s.startForeground();  % synchronous operation


% delete(s)    % happens anyway when the function is exited.

