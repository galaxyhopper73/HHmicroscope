function img_out = Fcn_record_updata(app, img_in)
lower_lim = app.minSlider_2.Value;
upper_lim = app.maxSlider_2.Value;
img_in = double(img_in);
% manual contrast
img_in(img_in<lower_lim) = lower_lim;
img_in(img_in>upper_lim) = upper_lim;
img_in = img_in-lower_lim;
img_in = img_in/(upper_lim-lower_lim);
img_out = uint8(img_in*255);
end