function Fcn_record_plot(app,ch,temp_ai,scan_idx,temp_t,seq_idx)
if strcmp(app.multi_clamp_para.(ch).clamp_mode,'VC')
    R1 = app.multi_clamp_para.(ch).VC_R;
    cmd1 = app.multi_clamp_para.(ch).VC_cmd;
    VC_gain = app.multi_clamp_para.(ch).VC_gain;
    switch R1(end)
        case'M'
            R1 = str2double(R1(1:end-1))*10^6;
        case'G'
            R1 = str2double(R1(1:end-1))*10^9;
    end
    plot(app.DAQ_vis_graph.(ch).UIAxes2,temp_t,temp_ai/R1/VC_gain*10^12,"red");
    if min(temp_t)>0.2
        ymin = min(temp_ai)/R1/VC_gain*10^12;
        ymax = max(temp_ai)/R1/VC_gain*10^12;
    end
elseif strcmp(app.multi_clamp_para.(ch).clamp_mode,'CC')
    %                                     R1 = app.multi_clamp_para.ch1.CC_R;
    CC_gain = app.multi_clamp_para.(ch).CC_gain;
    cmd1 = app.multi_clamp_para.(ch).CC_cmd;
    plot(app.DAQ_vis_graph.(ch).UIAxes2,temp_t,temp_ai*10^3/(app.multi_clamp_para.MemPoten*CC_gain),"red");
    if min(temp_t)>0.2
        ymin = min(temp_ai)*10^3/(app.multi_clamp_para.MemPoten*CC_gain);
        ymax = max(temp_ai)*10^3/(app.multi_clamp_para.MemPoten*CC_gain);
    end
end
if min(temp_t)>0.2 && max(temp_t)<0.4
    ylim(app.DAQ_vis_graph.(ch).UIAxes2,[ymin,ymax])
elseif min(temp_t)>0.4
    last_lim = ylim(app.DAQ_vis_graph.(ch).UIAxes2);
    ylim(app.DAQ_vis_graph.(ch).UIAxes2,[min(ymin,last_lim(1)),max(ymax,last_lim(2))]);
end
plot(app.DAQ_vis_graph.(ch).UIAxes,temp_t,app.queued_sequence(scan_idx,seq_idx)*cmd1,"blue");
end