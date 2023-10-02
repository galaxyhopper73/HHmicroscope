function LucamSetFormat(snapshot, cameraNum)
%LucamSetSnapshot - Sets the snapshot data structue used by the camera.
try
    LuDispatcher(119, cameraNum, snapshot);
catch ME
    rethrow(ME);
end    
