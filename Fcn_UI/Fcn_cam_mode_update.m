function Fcn_cam_mode_update(app)
mode_sele = app.exposuremodeButtonGroup.SelectedObject.Text;
try
    delete(app.DAQ_vis_graph.ch1);
    delete(app.DAQ_vis_graph.ch2);
catch
end
switch mode_sele
    case 'free recording'
        app.StreamdurationsEditField.Editable = "on";
        app.NumberofframesEditField.Editable = "on";
        app.camera_BSI.obj.FramesPerTrigger = Inf;
        triggerconfig(app.camera_BSI.obj,'immediate','none','none');
        app.camera_BSI.src.ExposeOutMode = 'Rolling Shutter';  % defines Trigger Ready position and Expose out signal
        app.camera_BSI.src.TriggerMode = 'Internal Trigger';
    case 'sync with patch clamp'
        app.StreamdurationsEditField.Editable = "off";
        app.NumberofframesEditField.Editable = "off";
        app.camera_BSI.obj.FramesPerTrigger = 1;
        app.camera_BSI.obj.TriggerRepeat = Inf;
        triggerconfig(app.camera_BSI.obj,'hardware','Falling edge','Extern');
        app.camera_BSI.src.ExposeOutMode = 'First Row';  % defines Trigger Ready position and Expose out signal
        app.camera_BSI.src.TriggerMode = 'Edge Trigger';
        [num_sample, ~] = size(app.queued_sequence);
        required_frames = num_sample/app.SamplingratekHzEditField.Value/app.exposuretimemsEditField.Value;
        exposure_time = app.exposuretimemsEditField.Value;
        app.NumberofframesEditField.Value = required_frames;
        app.StreamdurationsEditField.Value = required_frames*exposure_time/1000;
        % DAQ_vis creator only accepts AO
        if size(app.queued_sequence,2)>2  % two channels deployed
            AO0 = app.queued_sequence(:,1);
            AO1 = app.queued_sequence(:,2);
            app.DAQ_vis_graph.ch1 = DAQ_vis(app, AO0,1,app.multi_clamp_para.ch1.clamp_mode);
            app.DAQ_vis_graph.ch2 = DAQ_vis(app, AO1,2,app.multi_clamp_para.ch2.clamp_mode);
        else % single channel deployed
            AO = app.queued_sequence(:,1);
            if strcmp(app.deployButton_2.UserData.ch,'ch1')  % channel 1
                app.DAQ_vis_graph.ch1 = DAQ_vis(app, AO,1,app.multi_clamp_para.ch1.clamp_mode);
            else  % channel 2
                app.DAQ_vis_graph.ch2 = DAQ_vis(app, AO,2,app.multi_clamp_para.ch2.clamp_mode);
            end
        end
end
end