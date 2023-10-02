function LucamSetSnapshotGain(gain, cameraNum)
% LucamSetSnapshotGain - Sets the gain value for snapshot mode.
try
    propId = 51;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = gain;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
