function Fcn_cam_mode_update(app)
mode_sele = app.exposuremodeButtonGroup.SelectedObject.Text;
switch mode_sele
    case 'free recording'
        app.StreamdurationsEditField.Editable = "on";
        app.NumberofframesEditField.Editable = "on";
        app.camera_BSI.obj.FramesPerTrigger = Inf;
        triggerconfig(app.camera_BSI.obj,'immediate','none','none');
        app.camera_BSI.src.ExposeOutMode = 'Rolling Shutter';  % defines Trigger Ready position and Expose out signal
        app.camera_BSI.src.TriggerMode = 'Internal Trigger';
        delete(app.DAQ_vis_graph);
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
        delete(app.DAQ_vis_graph);
        app.DAQ_vis_graph = DAQ_vis(app, app.queued_sequence);
end
end