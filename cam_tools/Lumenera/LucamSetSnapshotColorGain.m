function LucamSetSnapshotColorGain(colorgainStruct, cameraNum)
% LucamSetSnapshotColorGain - Sets the color gain values in snapshot mode.
try
    colorgainStruct.IsVideo = false;
    LucamSetColorGains(colorgainStruct, cameraNum);
catch ME
    rethrow(ME);
end    
