function addROI(btn,app,roi,ROI_sele_Box)
app.ROIselectCheckBox.Value = false;
positionset = roi.Position; % entries [1 2 3 4]->[left top width height]
delete(roi);
newitem = strcat(num2str(positionset(1)),',',num2str(positionset(2)),',',num2str(positionset(3)),',',num2str(positionset(4)));
app.ROIDropDown.Items = [app.ROIDropDown.Items newitem];
close(ROI_sele_Box);
end