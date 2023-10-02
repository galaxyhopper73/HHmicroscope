function img_out = Fcn_record_updata(app, img_in)
lower_lim = app.minSlider.Value;
upper_lim = app.maxSlider.Value;
auto_contrast = app.autocontrastCheckBox;
[counts bin] = histcounts(img_in);
pos = find(counts == max(counts));
y_max = bin(pos(1));
[x_dim y_dim] = size(img_in);
img_in = double(img_in);
if auto_contrast.Value==0
    % manual contrast
    img_in(img_in<lower_lim) = lower_lim;
    img_in(img_in>upper_lim) = upper_lim;
    img_in = img_in-lower_lim;
    img_in = img_in/(upper_lim-lower_lim);
    img_out = uint16(img_in*65535);
else
    % auto contrast
    [mu, sigma] = normfit(reshape(img_in,[x_dim*y_dim 1]));
    lower_lim = mu-0.5*sigma;
    upper_lim = mu+0.5*sigma;
    img_in(img_in<lower_lim) = lower_lim;
    img_in(img_in>upper_lim) = upper_lim;
    img_in = img_in-lower_lim;
    img_in = img_in/(upper_lim-lower_lim);
    img_out = uint16(img_in*65535);
end
end