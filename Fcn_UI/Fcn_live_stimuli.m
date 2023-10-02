function Fcn_live_stimuli(app)
% this function is a template containing
% 1 NI daq channel deploying and rate setting
% 2 MultiClamp channel selection and mode setting
% 3 voltage clamp signal generation
if strcmp(app.channelselectionButtonGroup.SelectedObject.Text, 'ch1')
    ch_idx = 1;
    app.deployButton_2.UserData.ch = 1;
    addoutput(app.NI_daq.daq_cam,"Dev1","ao0","Voltage");
    addinput(app.NI_daq.daq_cam,"Dev1","ai0","Voltage");
else
    ch_idx = 2;
    app.deployButton_2.UserData.ch = 2;
    addoutput(app.NI_daq.daq_cam,"Dev1","ao1","Voltage");
    addinput(app.NI_daq.daq_cam,"Dev1","ai1","Voltage");
end
MC_select(app.MC_dev.handle,app.MC_dev.id(ch_idx));
MC_set_mode(app.MC_dev.handle,0); % set to VoltageClamp mode
out_gain = 0.05;
ljp = 0; %10;  % liquid junction potential for K9 pipette vs Normal ext solution
output = [zeros(1,50) 2*ones(1,50) zeros(1,50)]-ljp;
output_queue = output'*out_gain;
delete(app.DAQ_vis_graph);
app.DAQ_vis_graph = DAQ_vis(app, output_queue);
app.queued_sequence = output_queue;
app.NI_daq.daq_cam.Rate = 10000;
end