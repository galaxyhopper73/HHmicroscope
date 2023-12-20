function Fcn_preview_update(obj,event,himage)
UIcomp = obj.UserData;
ax_hist = UIcomp.hHist;
last_plot = ax_hist.Children;
delete(last_plot);
if size(event.Data,1)>1024
    hist_data = event.Data(513:1024,513:1024); 
else
    hist_data = event.Data;
end
auto_contrast = UIcomp.auto_cont;
h_hist = histogram(ax_hist,hist_data,'EdgeColor',"k","FaceColor","#0072BD");
hold(ax_hist,'on');
y_max = max(h_hist.Values);
[x_dim y_dim] = size(hist_data);
img_in = double(event.Data);
[mu, sigma] = normfit(reshape(hist_data,[x_dim*y_dim 1]));
if ~UIcomp.hold.Value
    UIcomp.min_slider.Limits = [mu-10*sigma mu+10*sigma];
    UIcomp.max_slider.Limits = [mu-10*sigma mu+10*sigma];
end
if auto_contrast.Value==0
    % manual contrast
    lower_lim = UIcomp.min_slider.Value;
    upper_lim = UIcomp.max_slider.Value;
else
    % auto contrast
    lower_lim = mu-10*sigma; %2
    upper_lim = mu+5*sigma; %2 
    UIcomp.min_slider.Value = lower_lim;
    UIcomp.max_slider.Value = upper_lim;
end
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
else
    img_out = imrotate(img_out,90);
end
himage.CData = img_out;
end