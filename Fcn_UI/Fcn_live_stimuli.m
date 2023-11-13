function Fcn_live_stimuli(app)
% this function is a template container
% 1 NI daq channel deploying and rate setting
% 2 MultiClamp channel selection and mode setting
% 3 voltage clamp signal generation
out_gain = 0.05;
ljp = 0; %10;  % liquid junction potential for K9 pipette vs Normal ext solution
output = [zeros(1,50) 2*ones(1,50) zeros(1,50)]-ljp;
output_queue = output'*out_gain;
try
    delete(app.DAQ_vis_graph.ch1);
    delete(app.DAQ_vis_graph.ch2);
catch
end
if strcmp(app.channelButtonGroup.SelectedObject.Text, 'ch1')
    app.deployButton_2.UserData.ch = 1;
    addoutput(app.NI_daq.daq_cam,"Dev1","ao0","Voltage");
    addinput(app.NI_daq.daq_cam,"Dev1","ai0","Voltage");
    MC_select(app.MC_dev.handle,app.MC_dev.id(1));
    app.DAQ_vis_graph.ch1 = DAQ_vis(app, output_queue,1);
else
    app.deployButton_2.UserData.ch = 2;
    addoutput(app.NI_daq.daq_cam,"Dev1","ao1","Voltage");
    addinput(app.NI_daq.daq_cam,"Dev1","ai1","Voltage");
    MC_select(app.MC_dev.handle,app.MC_dev.id(2));
    app.DAQ_vis_graph.ch2 = DAQ_vis(app, output_queue,2);
end
MC_set_mode(app.MC_dev.handle,0); % set to VoltageClamp mode
app.queued_sequence = output_queue;
app.NI_daq.daq_cam.Rate = 10000;
pause(1)
end