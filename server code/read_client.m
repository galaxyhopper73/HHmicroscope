function read_client(src,event,dev)
message = readline(src);
message = convertStringsToChars(message);
idf = strfind(message,'_');
cmd = message(idf+1:end);
rack = message(1:idf-1);
switch rack
    case 'xy'
        writeline(dev.xy,cmd);
        answer = readline(dev.xy);
    case 'manip1'
        writeline(dev.manip1,cmd);
        answer = readline(dev.manip1);
    case 'manip2'
        writeline(dev.manip2,cmd);
        answer = readline(dev.manip2);
    otherwise
        answer = 'invalid device';
end
writeline(src,answer);
end