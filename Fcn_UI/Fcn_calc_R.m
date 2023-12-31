function R_GigaSeal = Fcn_calc_R(app,output)
input = app.queued_seq_live;
% output = app.gigasealButton.UserData.data;
[pos, ~] = find(input == input(length(input)/2));
aver_output = mean(output(pos(1)+10:pos(end)-10));
aver_output_bl1 = mean(output(1:pos(1)-10));
aver_output_bl2 = mean(output(pos(end)+10:length(input)));
aver_output_eff = aver_output-(aver_output_bl1+aver_output_bl2)/2;
aver_input_eff = input(pos(1))-input(1);
str_fb_resist = app.VCEditField.Value;
sens_cmd = app.VCcmdmVVEditField.Value;
switch str_fb_resist(end)
    case'M'
        resistor = str2double(str_fb_resist(1:end-1))*10^6;
    case'G'
        resistor = str2double(str_fb_resist(1:end-1))*10^9;
end
curent = aver_output_eff/resistor/app.VCEditField_3.Value;
voltage = aver_input_eff*sens_cmd*10^(-3);
R_GigaSeal = voltage/curent/10^6;
end