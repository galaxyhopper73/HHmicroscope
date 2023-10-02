function LucamSetSnapshotExposure(exposure, cameraNum)
% LucamSetSnapshotExposure - Sets the exposure time for snapshot mode.
try
    propId = 50;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = exposure;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
