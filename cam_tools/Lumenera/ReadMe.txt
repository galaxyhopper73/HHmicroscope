Lumenera's Matlub Plug-in requirements:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 - The Microsoft Visual Studio 2015 redistributable files are required and can be downloaded directly from 
    the Microsoft Website.
 - Lumenera LuCam Software package 6.8.1 is required for both camera API and camera device drivers.
 - This plug-in has been tested with Matlab R2017a and R2017b
 


Lumenera's MatLab Plug-in Installation Instructions:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 - Run the installation program.


Lumenera's Image Acquisition Toolkit Adaptor Installation Instructions:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install the Image Acquisition Toolkit Adaptor, use the following commands:

	>> imaqregister('<path to containing folder>\lumeneraimaq.dll');
	>> imaqreset

Where <path to containing folder> is the path to the folder where lumeneraimaq.dll is located [typically C:\Lumenera Matlab Plugin].


To uninstall the Adapter, type the following:

	>> imaqregister('<path to containing folder>\lumeneraimaq.dll', 'unregister');
	>> imaqreset


Lumenera's MatLab Plug-In Usage Notes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Lumenera MatLab Plug-in contains all the functions needed to access and control your Lumenera camera. Most of the functions contain an extra parameter that defines the camera number you wish to work with. This plug-in currently supports accessing up to 25 cameras at once.

The new LucamTakeSynchronousSnapshots() function will take snapshots from all the cameras that have an open connection. Also note that the frame size required for this function has to be the same for each camera being used. 
