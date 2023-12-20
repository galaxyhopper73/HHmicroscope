% maximum 2 Gb per hyperstack. matlab double type 8 bytes 
% 8 Mb per full frame image
% exposure time varies from 10 ms to 50 ms, FPS varies from 20 to 100
% minimal period of 2.5 seconds per scan session is allowed
% ultra fast acquisition like 1000 FPS, 256*256 ROI, 1ead to 16 seconds
% scan session
% 
% for 16 seconds 2 channel scanning aix2 aox2 and 50kHz scan rate 
% 16*4*50000*8bytes = 25.6 Mb memory

function [output clp_mode] = VC_paradigm(sampling_rate)
clp_mode = 'VC';
activation_t = 0.5; % sec
rep = 30;
output = [];
for i = 1:rep
    if rem(i,2)==1
        seed = ones(activation_t*sampling_rate*1000,1)*(-90);
    else
        seed = ones(activation_t*sampling_rate*1000,1)*(-90)+i*10/2;
    end
    output = [output; seed];
end
end