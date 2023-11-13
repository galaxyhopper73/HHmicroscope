function R_GigaSeal = Fcn_calc_R(app,aver_input,aver_output)
str_fb_resist = app.VCEditField.Value;
sens_cmd = app.VCcmdmVVEditField.Value;
switch str_fb_resist(end)
    case'M'
        resistor = str2double(str_fb_resist(1:end-1))*10^6;
    case'G'
        resistor = str2double(str_fb_resist(1:end-1))*10^9;
end
curent = aver_output/resistor;
voltage = aver_input*sens_cmd*10^(-3);
R_GigaSeal = voltage/curent/10^6;
end