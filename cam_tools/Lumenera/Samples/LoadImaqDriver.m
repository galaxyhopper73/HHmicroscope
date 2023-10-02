function LoadImaq(file)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%imaqfile='c:\Lumenera Matlab driver V2.0.1\LumeneraimaqW32.dll';
%imaqregister(imaqfile,'unregister');
%imaqreset;
imaqregister(file);
imaqreset;

end




