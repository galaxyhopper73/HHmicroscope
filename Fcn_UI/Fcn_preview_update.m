function Fcn_preview_update(obj,event,himage)
UIcomp = obj.UserData;
ax_hist = UIcomp.hHist;
last_plot = ax_hist.Children;
delete(last_plot);
auto_contrast = UIcomp.auto_cont;
h_hist = histogram(ax_hist,event.Data,'EdgeColor',"k","FaceColor","#0072BD");
hold(ax_hist,'on');
y_max = max(h_hist.Values);
[x_dim y_dim] = size(event.Data);
img_in = double(event.Data);
[mu, sigma] = normfit(reshape(event.Data,[x_dim*y_dim 1]));
if ~UIcomp.hold.Value
    UIcomp.min_slider.Limits = [mu-10*sigma mu+10*sigma];
    UIcomp.max_slider.Limits = [mu-10*sigma mu+10*sigma];
end
if auto_contrast.Value==0
    % manual contrast
    lower_lim = UIcomp.min_slider.Value;
    upper_lim = UIcomp.max_slider.Value;
    y = linspace(0,y_max,upper_lim-lower_lim+1);
    x = lower_lim:1:upper_lim;
    plot(ax_hist,x,y,'LineWidth',2,'Color','k');
    img_in(img_in<lower_lim) = lower_lim;
    img_in(img_in>upper_lim) = upper_lim;
    img_in = img_in-lower_lim;
    img_in = img_in/(upper_lim-lower_lim);
    img_out = uint8(img_in*255);
    if strcmp(obj.SelectedSourceName,'LumeneraSource')
        img_out = imrotate(img_out,90);
        img_out = flip(img_out,2);
        ROI = obj.ROIPosition;
        img_out = img_out(ROI(1)+1:ROI(1)+ROI(3),ROI(2)+1:ROI(2)+ROI(4));
    end
    himage.CData = img_out; % can only be 8 bits image
else
    % auto contrast
    lower_lim = mu-1*sigma;
    upper_lim = mu+1*sigma;
    UIcomp.min_slider.Value = lower_lim;
    UIcomp.max_slider.Value = upper_lim;
    y = linspace(0,y_max,upper_lim-lower_lim+1);
    x = lower_lim:1:upper_lim;
    plot(ax_hist,x,y,'LineWidth',2,'Color','k');
    img_in(img_in<lower_lim) = lower_lim;
    img_in(img_in>upper_lim) = upper_lim;
    img_in = img_in-lower_lim;
    img_in = img_in/(upper_lim-lower_lim);
    img_out = uint8(img_in*255);
    if strcmp(obj.SelectedSourceName,'LumeneraSource')
        img_out = imrotate(img_out,90);
        img_out = flip(img_out,2);
        ROI = obj.ROIPosition;
        img_out = img_out(ROI(1)+1:ROI(1)+ROI(3),ROI(2)+1:ROI(2)+ROI(4));
    end
    himage.CData = img_out;
end
end