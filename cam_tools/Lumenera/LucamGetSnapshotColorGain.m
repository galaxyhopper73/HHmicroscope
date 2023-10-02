% Call as such: [red,green1,green2,blue] = LucamGetSnapshotColorGain(<cameraNum>);
function [gains] = LucamGetSnapshotColorGain(cameraNum)
% LucamGetSnapshotColorGain - Returns the snapshot color gain values.
try
    gains = LuDispatcher(21, cameraNum, false);
catch ME
    rethrow(ME);
end    
