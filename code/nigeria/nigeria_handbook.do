* Project: LSMS-ISA Processed Dataset Handbook
* Created on: October 2020
* Created by: jdm
* Stata v.16.1

* does
	* compiles nigeria handbook

* assumes
	* access to all data and code
	* assumes data is downloaded into folders once directory is created

* TO DO:
	* add all do-files


* **********************************************************************
* 0 - setup
* **********************************************************************

* define paths
	global		root	= 	"$data/nigeria"
	global		hndk	= 	"$code/nigeria"


* **********************************************************************
* 1 - build handbook
* **********************************************************************

* compile nigeria handbook documents		
	*markstat using "$hndk/wave_2/yield_construct", docx
	
	markstat using "$hndk/wave_2/area_construct", docx keep
	
*	markstat using "$hndk/wave_2/planting_labor", docx

*	markstat using "$hndk/wave_2/fertilizer", docx


	


	
