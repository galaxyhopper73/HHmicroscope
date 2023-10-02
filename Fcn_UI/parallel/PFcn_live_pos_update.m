function PFcn_live_pos_update(app)
writeline(app.obj_client,'xy_POS');
app.obj_client.UserData = readline(app.obj_client);
xyz_pos = regexp(app.obj_client.UserData,'\t','split');
app.xSpinner.Value = -round(str2num(xyz_pos(1))/10);
app.ySpinner.Value = round(str2num(xyz_pos(2))/10);
Fcn_plot_cur_pos(app);
end