bit16=true;
LucamSet16BitCapture(bit16,1);
LucamSet16BitSnapshot(bit16,1);
raw = LucamSnapRawFrame(1);
DisplayRaw(raw);
im = LucamConvertFrameToRgb(1, raw);
image(im);
clear('raw');
clear('im');
im = LucamTakeFastFrames(1,1);
image(im);
clear('im');
im = LucamTakeMultipleSnapshots(3,1);
imaqmontage(im);
im = LucamTakeSnapshot(1);
image(im);
 
 
LucamShowPreview(1);
raw = LucamCaptureRawFrame(1);
DisplayRaw(raw);
im = LucamConvertFrameToRgb(1, raw);
image(im);
im = LucamCaptureFrame(1);
image(im);
im = LucamCaptureMonochromeFrame(1);
DisplayMono(im);
im = LucamCaptureMultipleFrames(5,1);
imaqmontage(im)
LucamCaptureSaveFrame('toto.tif', false, 1);
 
im = LucamTakeVideo(1,1);
image(im);
LucamHidePreview(1);
 
  
 
 
 