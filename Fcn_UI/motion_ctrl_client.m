clear;clc;
% device list 'xy' 'manip1' 'manip2'
obj_client = tcpclient("172.29.28.198",4000);
configureTerminator(obj_client,"LF");
configureCallback(obj_client,"terminator",@(src,event)Fcn_read_server(src,event));
obj_client.UserData = readline(obj_client);
writeline(obj_client,'manip2_ZERO');
