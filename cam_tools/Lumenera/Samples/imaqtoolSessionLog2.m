vid = videoinput('lumeneraimaq', 1, '2592x1944');
src = getselectedsource(vid);

vid.FramesPerTrigger = 1;

preview(vid);

start(vid);

stoppreview(vid);

src.FLIPPING = 'Flip';

preview(vid);

src.FLIPPING = 'None';

src.FLIPPING = 'Mirror';

src.GAIN_BLUE = 1;

src.GAIN_GREEN1 = 1;

src.GAIN_GREEN2 = 1;

src.GAIN_RED = 1;

src.WB_Iterations = 1;

stoppreview(vid);

