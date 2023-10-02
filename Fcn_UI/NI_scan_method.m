function NI_scan_method(obj,evt)
% sprintf('scanned sample = %d', obj.NumScansOutputByHardware-obj.UserData.last_scanned)
% obj.UserData.last_scanned = obj.NumScansOutputByHardware;
% obj is the DataAcquisition object passed in. evt is not used.
if obj.UserData.ScanIdx < obj.UserData.Repeat
    scan_data = [obj.UserData.ScanData.ao(:,obj.UserData.ScanIdx + 1) obj.UserData.ScanData.do(:,obj.UserData.ScanIdx + 1)];
    sprintf('acquired frames = %d', obj.UserData.Cam_obj.FramesAcquired)
    preload(obj,scan_data);
    obj.UserData.ScanIdx = obj.UserData.ScanIdx + 1;
else 
stop(obj)
end