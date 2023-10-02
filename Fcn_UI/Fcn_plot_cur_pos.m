function Fcn_plot_cur_pos(app)
try
    delete(app.UIAxes4.UserData.cur_pos)
catch
end
app.UIAxes4.UserData.cur_pos = plot(app.UIAxes4,app.xSpinner.Value/1000,app.ySpinner.Value/1000,'o','MarkerEdgeColor','k',...
    'MarkerFaceColor','k');
end