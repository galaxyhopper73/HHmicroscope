function [gains] = LucamGetColorGains (video, cameraNum)
% LucamGetColorGains - Get all colour gains for video or snapshot mode.
% video - flag to select from video or snapshot.  Set to true for video.
% cameraNum - Camera index number.
% return color gains data structure..
try
    gains = LuDispatcher(21, cameraNum, video);
catch ME
    rethrow(ME);
end    
