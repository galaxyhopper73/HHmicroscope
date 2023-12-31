function Fcn_live_stimuli(app)
% this function is a template container
% rest potential -10 mV action potential -8mV
% 1 NI daq channel deploying and rate setting
% 2 MultiClamp channel selection and mode setting
% 3 voltage clamp signal generation
if strcmp(app.modeButtonGroup.SelectedObject.Text,'VC') %CC clamp
    if strcmp(app.scenarioButtonGroup.SelectedObject.Text,'bath')
        rest_po = 0;
        act_po = 2;
    else
        rest_po = -60;  % unit mV
        act_po = -58;
    end
    liq_junc_po = 10;  % liquid junction potential for K9 pipette vs Normal ext solution
    output = zeros(1,150)+rest_po;
    output(1,51:100) = act_po;
    output = output-liq_junc_po;
    % output = [zeros(1,50) 2*ones(1,50) zeros(1,50)]-liq_junc_po;
    if strcmp(app.channelButtonGroup.SelectedObject.Text, 'ch1')
        cmd_sen = app.multi_clamp_para.ch1.VC_cmd;
    else
        cmd_sen = app.multi_clamp_para.ch2.VC_cmd;
    end
    app.queued_seq_live = output'/cmd_sen;
else
    if strcmp(app.channelButtonGroup.SelectedObject.Text, 'ch1')
        cmd_sen = app.multi_clamp_para.ch1.CC_cmd;
    else
        cmd_sen = app.multi_clamp_para.ch2.CC_cmd;
    end
    output = ones(1,150)*app.curentpASlider.Value;
    app.queued_seq_live = output'/cmd_sen;
end
end