function tf = ImaqIsAdaptorRegistered()
% return true if Lumenera adaptor has been registered
try
    ImaqGetAdaptor();
    tf = true;
catch
    tf = false;
end