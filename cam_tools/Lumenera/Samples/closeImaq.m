try
    %clear all;
    [status, values] = fileattrib('..\lumeneraimaq.dll');
    if status == false
        [status, values] = fileattrib('lumeneraimaq.dll');
    end
    if status == false
        [status, values] = fileattrib('.\Lumenera\lumeneraimaq.dll');
    end    
    if status == false
        msg = MException('did not find lumeneraimaq.dll');
        throw(msg);
    end
    imaqregister(values.Name,'unregister');
    imaqreset;
catch Ex
    report = getReport(Ex, 'basic', 'hyperlinks', 'off');
    fprintf('%s\n', report);
end

