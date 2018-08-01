		BLOBSCANNER PROCESSING LIBRARY VERSION 0.1-alpha
author: Antonio Moinaro (c)
license: GPLv3
document version: 0.1 
date: 18/01/14 02:00:25
	 
			  

CHANGES

The first thing you need to know, especially if you have already used a previous
versions, is that the import name has changed from Blobscanner to blobscanner, 
to be more in line with the Java guidelines. The second thing is about the 
constructor of the Detector class, which also (for the new users) is the only
class: two new constructors have been added:

		Detector(PApplet parent)	                             (1)

		Detector(PApplet parent,int threshold)			     (2)

if you use the #1 you need to call the method to set the blob's threshold value 
at least one time:
	        	
		setThreshold(int threshold)				     (3)

The new constructors set automatically the area searched for blobs to the 
entire image, by default, but this behaviour can be altered by calling the 
following method:

		setRoi(int startx,int starty,int roiwidth,int roiheight)     (4)

 #4 defines a Region Of Interest to be searched for blobs, minimizing the 
amount of pixels to be scanned, with a consequent increasing in the speed of 
execution. The method is paired with another one which revert to default the size
of the ROI :

		unsetRoi() 						     (5)

after calling #5 the entire image is once again scanned for blob, as it was before 
calling #4.

The old constructor was left to provide some backward compatibility for users who 
decide to install the new version. It will be removed in a future release. 


SOURCE CODE

Blobscanner's source code has a new home on github at:
		https://github.com/robdanet/blobscanner                       
		
from there the entire project, including the executable jar file is downloadable 
as zip archive.

The same zip archive is downloadable from the project website at: 
		https://sites.google.com/site/blobscanner/Download

The previous version's (0.3.4-pre-alpha) source code and executable are still 
available as zip archive at: 
		http://code.google.com/p/blobscanner/


BUGS, SUGGESTION and HELP REQUESTS 

The best place to ask for help and advice is the thread relative to this library 
on the Processing's forum at:
		http://forum.processing.org/two
		 	
If you need to contact me to report a bug or you have some suggestions to give 
or if you have a problem related to Blobscanner, you can also  send me an 
email to:

		blobdetector.info@gmail.com

LICENSE 

Blobscanner is free software and is released under  GNU GENERAL PUBLIC LICENSE
Version 3, which you can read at:
		http://www.gnu.org/licenses/gpl-3.0.txt

MISC.
If you stumbled upon this document and you don't know about Processing, 
visit one of the following sites:
		http://processing.org/
		http://hello.processing.org/
		http://wiki.processing.org/w/Main_Page
		http://www.openprocessing.org/
		http://vimeo.com/groups/processing
