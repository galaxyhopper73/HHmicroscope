% maximum 2 Gb per hyperstack. matlab double type 8 bytes 
% 8 Mb per full frame image
% exposure time varies from 10 ms to 50 ms, FPS varies from 20 to 100
% minimal period of 2.5 seconds per scan session is allowed
% ultra fast acquisition like 1000 FPS, 256*256 ROI, 1ead to 16 seconds
% scan session
% 
% for 16 seconds 2 channel scanning aix2 aox2 and 50kHz scan rate 
% 16*4*50000*8bytes = 25.6 Mb memory

function [output clp_mode] = VC_step(sampling_rate)
clp_mode = 'VC';
voltage_ini = -70; %unit mV
voltage_end = 70;
stepsize = 10;
voltage = (voltage_ini:stepsize:voltage_end);
output = [];
activation_t = 2; % unit sec
for i = 1:length(voltage)
    seed = ones(activation_t*sampling_rate*1000,1)*voltage(i);
    output = [output; seed];
end
end