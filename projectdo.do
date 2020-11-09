* Project: LSMS-ISA Processed Dataset Handbook
* Created on: October 2020
* Created by: jdm
* Stata v.16.1

* does
	* establishes an identical workspace between users
	* sets globals that define absolute paths
	* serves as the starting point to find any do-file, dataset or output
	* loads any user written packages needed for analysis
	* compiles handbook

* assumes
	* access to all data and code
	* assumes data is downloaded into folders once directory is created

* TO DO:
	* add all do-files


* **********************************************************************
* 0 - setup
* **********************************************************************

* set $dirCreate to 0 to skip directory creation
	global 			dirCreate	1

* set $pack to 0 to skip package installation
	global 			pack 		0
	
* set $document to 0 to skip building handbook
	global			document	0
	
* specify Stata version in use
    global stataVersion 16.1    // set Stata version
    version $stataVersion

	
* **********************************************************************
* 0 (a) - Create user specific paths
* **********************************************************************


* define root folder globals
    if `"`c(username)'"' == "jdmichler" {
        global 		project  	"C:/Users/jdmichler/git/lsms-isa_processed_dataset"
		
		* tell Stata where to find the relevant programs
		whereis pdflatex 		"C:/Program Files/MiKTeX/miktex/bin/x64/pdflatex.exe"
		whereis pandoc 			"C:/Program Files/Pandoc/pandoc.exe"
    }

    if `"`c(username)'"' == "aljosephson" {
        global 		project  	"C:/Users/aljosephson/git/lsms-isa_processed_dataset"
		
		* tell Stata where to find the relevant programs
		whereis pdflatex 		"C:/Program Files/MiKTeX 2.9/miktex/bin/x64/pdflatex.exe"
		whereis pandoc 			"C:/Program Files/Pandoc/pandoc.exe"
    }

    if `"`c(username)'"' == "emilk" {	
        global 		project  	"C:/Users/emilk/git/lsms-isa_processed_dataset"	
		
		* tell Stata where to find the relevant programs
		whereis pdflatex 		"C:/Program Files/MiKTeX/miktex/bin/x64/pdflatex.exe"
		whereis pandoc 			"C:/Users/emilk/AppData/Local/Pandoc/pandoc.exe"
    }
	
* **********************************************************************
* 0 (b) - set up local folder structure
* **********************************************************************

* define sub-folder global for code cloned from github
    global code					"$project/code"
	
* create sub-folder for data and define global for data
	qui: capture mkdir			"$project/data"
    global data					"$project/data"
	
* create sub-folder for output and define global for output
	qui: capture mkdir			"$project/output"
    global output				"$project/output"
	

* **********************************************************************	
/* within each data folder, standardize sub-folders
	data
		country			// one folder per country
			wave			// one folder per wave
				raw 	        // contains raw data, never to be altered
				refined			// contains any intermediate data sets
				analysis	    // analysis-ready data sets
			logs			// where log files live
	code	     
		country			// one folder per country
			wave			// one folder per wave
				raw 	        // scripts for cleaning raw data
				refined			// scripts for cleaning refined data
				analysis	    // scripts for analysis
 	output
        tables
        figures
	documentation	    // documentation
	questionnaire	    // questionnaires
* **********************************************************************/

* make a local macro containing all the folder names
    loc direct = "ethiopia malawi niger nigeria tanzania uganda"
	loc round  = "wave_1 wave_2 wave_3"
	
if $dirCreate == 1 {
	foreach folder of local direct {
		foreach wave of local round {
		* capture ignores the error code if directory exists
		qui: capture mkdir 		"$data/`folder'/"
		qui: capture mkdir 		"$data/`folder'/`wave'/"
		qui: capture mkdir 		"$data/`folder'/`wave'/raw/"
		qui: capture mkdir 		"$data/`folder'/`wave'/refined/"
		qui: capture mkdir 		"$data/`folder'/`wave'/analysis/"
		qui: capture mkdir 		"$data/`folder'/logs/"
		}
	}

    * Overall analysis
		qui: capture mkdir		"$output/tables/"
		qui: capture mkdir		"$output/figures/"
}

	
* **********************************************************************
* 0 (c) - Check if any required packages are installed
* **********************************************************************

* install packages if global is set to 1
if $pack == 1 {
	
	* temporarily set delimiter to ; so can break the line
		#delimit ;
	* for packages/commands, make a local containing any required packages
		loc userpack "blindschemes mdesc estout distinct winsor2" ;
		#delimit cr
	
	* install packages that are on ssc	
		foreach package in `userpack' {
			capture : which `package', all
			if (_rc) {
				capture window stopbox rusure "You are missing some packages." "Do you want to install `package'?"
				if _rc == 0 {
					capture ssc install `package', replace
					if (_rc) {
						window stopbox rusure `"This package is not on SSC. Do you want to proceed without it?"'
					}
				}
				else {
					exit 199
				}
			}
		}

	* install -xfill- package
		net install xfill, replace from(https://www.sealedenvelope.com/)
		
	* install -customsave package
		net install StataConfig, ///
		from(https://raw.githubusercontent.com/etjernst/Materials/master/stata/) replace
	
	* update all ado files
		ado update, update

	* set graph and Stata preferences
		set scheme plotplain, perm
		set more off
}


/* END */