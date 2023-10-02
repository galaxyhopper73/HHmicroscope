function ImaqOpen()
% Register Lumenera Imaq adaptor.
% this function may require you to update location of lumeneraimaq.dll
% file.
try
    if ~ImaqIsAdaptorRegistered()
        file = 'lumeneraimaq.dll';
        [status, values] = fileattrib(file);
        [filepath,name,ext] = fileparts(file);
        if status == false
            msg = MException(ImaqGetMessageErrorId(),'did not find lumeneraimaq.dll');
            throw(msg);
        end
        imaqregister(values.Name);
        imaqreset;
        imaqhwinfo(name);
    end

catch Ex
    rethrow(Ex);
end