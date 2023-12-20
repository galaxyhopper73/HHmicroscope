% maximum 2 Gb per hyperstack. matlab double type 8 bytes 
% 8 Mb per full frame image
% exposure time varies from 10 ms to 50 ms, FPS varies from 20 to 100
% minimal period of 2.5 seconds per scan session is allowed
% ultra fast acquisition like 1000 FPS, 256*256 ROI, 1ead to 16 seconds
% scan session
% 
% for 16 seconds 2 channel scanning aix2 aox2 and 50kHz scan rate 
% 16*4*50000*8bytes = 25.6 Mb memory

function [output clp_mode] = example_stimuli_5(sampling_rate)
exposure_t = 20; % ms
% sampling_rate = 10000; % Hz
activation_t = 3; % s
recovery_t = 0.4; %s
dutycycle_trig = 0.1;

% ao output sinusoidal wave five times with 1 volt increment per session
seed = ones(activation_t*sampling_rate*1000,1)*(-3.5);
tot_t = activation_t+recovery_t;
tot_num_trig = tot_t*1000/exposure_t;
sampling_per_trig = exposure_t/1000*sampling_rate*1000;
seed_trig = zeros (sampling_per_trig,1);
seed_trig(1+dutycycle_trig*sampling_per_trig*0.5:dutycycle_trig*sampling_per_trig) = 1;
trig_line = seed_trig*ones(1,tot_num_trig);
trig_line = reshape(trig_line,[sampling_per_trig*tot_num_trig 1]);
recovery_t = floor(tot_t*1000/exposure_t)*exposure_t/1000-activation_t; % adapt recover_t to align trigger space after concatinating
% blank_out = zeros(recovery_t*sampling_rate*1000,1);
seed = [seed];
% output.do = [];
output = [];
for i = 1:20
    if rem(i,2)
        output = [output; seed];
    else
        output = [output; seed+5.5];
    end
    
%     output.do = [output.do; trig_line];
end 
end