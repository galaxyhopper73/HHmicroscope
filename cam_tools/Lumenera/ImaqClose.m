function ImaqClose()
% Unregister Lumenera Imaq adaptor.
try
    %clear all;
    handle = ImaqGetAdaptor();
    [status, values] = fileattrib(handle.AdaptorDllName);
    if status == false
        msg = MException(ImaqGetMessageErrorId(), 'did not find lumeneraimaq.dll');
        throw(msg);
    end
    imaqregister(values.Name,'unregister');
    imaqreset;
catch Ex
    report = getReport(Ex, 'basic', 'hyperlinks', 'off');
    fprintf('%s\n', report);
end

