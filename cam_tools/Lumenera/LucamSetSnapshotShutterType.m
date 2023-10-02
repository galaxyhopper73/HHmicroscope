function LucamSetSnapshotShutterType(cameraNum, shutterType)
% LucamSetSnapshotShutterType - sets the shutter type on the camera with ID cameraNum.
try
    LuDispatcher(78, cameraNum, shutterType);
catch ME
    rethrow(ME);
end    
