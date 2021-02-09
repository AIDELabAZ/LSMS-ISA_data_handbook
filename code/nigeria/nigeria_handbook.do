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

* Compile nigeria handbook documents	

* **********************************************************************
*area_construct
* **********************************************************************

	markstat using "$hndk/wave_2/area_construct", docx
	
* **********************************************************************
*fertilizer
* **********************************************************************

	markstat using "$hndk/wave_2/fertilizer", docx

* **********************************************************************
*other_inputs_pest_irr
* **********************************************************************

	markstat using "$hndk/wave_2/other_inputs_pest_irr", docx
	
* **********************************************************************	
* crop_output
* **********************************************************************

	markstat using "$hndk/wave_2/crop_output", docx
	
* **********************************************************************
*planting_labor
* **********************************************************************
	
	markstat using "$hndk/wave_2/planting_labor", docx
	
* **********************************************************************	
*harvest_labor
* **********************************************************************

	markstat using "$hndk/wave_2/harvest_labor", docx

* **********************************************************************
*Yield
* **********************************************************************

	markstat using "$hndk/wave_2/yield", docx

	


	
