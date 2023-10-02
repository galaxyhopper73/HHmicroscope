function handle = ImaqGetAdaptor()
% Get Lumenera Imaq adaptor.
try
    h = imaqhwinfo();
    [ a, numberAdapters] = size( h.InstalledAdaptors);
    index = -1;
    for c = 1:numberAdapters
        if strcmp(h.InstalledAdaptors{c}, 'lumeneraimaq') 
            index = c;
            break;
        end
    end
   
    if index < 1
        msg = MException(ImaqGetMessageErrorId(), 'did not find lumeneraimaq adaptors');
        throw(msg);
    else
        handle = imaqhwinfo(string(h.InstalledAdaptors{index}));
    end
catch Ex
    rethrow(Ex);
end

