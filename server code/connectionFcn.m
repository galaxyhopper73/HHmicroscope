function connectionFcn(src,~)
if src.Connected
    connect_state = "Successfully connected to server.";
    writeline(src,connect_state);
end
end