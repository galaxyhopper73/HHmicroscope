function [frames] = LucamTakeSynchronousSnapshots()
%LucamTakeSynchronousSnapshots - Takes a snapshot from all cameras with an open connection at the same time.
% Camera sizes must all be the same.
try
    frames = LuDispatcher(32);
catch ME
    rethrow(ME);
end    
