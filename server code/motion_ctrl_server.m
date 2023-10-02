clear;clc;
%% devicce initialization
dev = struct('xy',[],'manip1',[],'manip2',[]);
dev.xy = serialport("COM3",9600,"Timeout",500,"Parity","none","StopBits",1);
configureTerminator(dev.xy,"CR");
dev.manip1 = serialport("COM4",9600,"Timeout",500,"Parity","none","StopBits",1);
configureTerminator(dev.manip1,"CR");
dev.manip2 = serialport("COM5",9600,"Timeout",500,"Parity","none","StopBits",1);
configureTerminator(dev.manip2,"CR");
%% server
obj_server = tcpserver("172.29.28.198",4000,"Timeout",1,"ConnectionChangedFcn",@connectionFcn);
configureTerminator(obj_server,"LF");
configureCallback(obj_server,"terminator",@(src,event)read_client(src,event,dev));