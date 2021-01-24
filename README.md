# LSMS-ISA Handbook on Data Processing
## LSMS-ISA Processed Dataset Construction and Documentation

The data handbook is an annotated code book listing and explaining the procedures used to clean and prepare the LSMS-ISA data and make a household agricultural production dataset. The agricultural production dataset is designed to estimate crop production functions at the household level. There are 6 preliminary guide documents on the making of datasets for fertilizer, harvest labor, planting labor, crop output, pesticide-herbicide-fungicide-irrigation, and land area. There is a final guide called "yield" which combines the preliminary datasets to make a dataset ready to estimate crop production functions.

The guide combines the code, the explanations of the code, and the output in a single document. The user generates the guide by running a stata do file that runs the code with the data and compiles the results into a single document. To compile the guide please follow the steps below.

##  Getting Started: Setting Up A Dev Environment

The git repository contains the guide document code, "nigeria_handbook.do" for compiling the guide documents, a "project.do" to set the file path for the raw data from the World Bank, and land-conversion.dta which is a land unit conversion file. Before we compile the documents we must clone the git repository on our local computer and set up the file structure that will contain the raw data.

### Steps:
1. Download and install pandoc at https://pandoc.org/installing.html. We use pandoc to compile the code into a word document.

2. Download a local copy of the code (clone the repository)
   
  Open Github desktop. From the `file` menu in the uppermost tool bar select `clone repository...`. In the `clone repository` menu select the `URL` tab and paste and this url or this username/repository_name in the box:
  
   ```sh 
  https://github.com/jdavidm/lsms-isa_data_handbook or jdavidm/lsms-isa_data_handbook
   ```
   After the github has located repository select the `clone repository` button.
   
 3. Open the "project.do"
 
  Once the repository has been cloned to your local, locate in the "lsms-isa_data_handbook" file in the local "git" folder the "project.do" and open "project.do" in stata.
   
 4. Edit the "project.do"
 
   The "project.do" creates a local file directory to store the raw datasets and the cleaned dataset. We have to do a bit of global path editing on "project.do" to work for your unique local computer username. The edits are specific to your computer and will allow the "project.do" file to use and create the paths on and for your local computer.
   
  On line 30, 31, and 35 replace "USERNAME" with your unique local computer username.
   
   ```
       if `"`c(username)'"' == "USERNAME" {	
        global 		project  	"C:/Users/USERNAME/git/lsms-isa_data_handbook"	
		
		* tell Stata where to find the relevant programs
		whereis pdflatex 		"C:/Program Files/MiKTeX/miktex/bin/x64/pdflatex.exe"
		whereis pandoc 			"C:/Users/USERNAME/AppData/Local/Pandoc/pandoc.exe"
    }
   ```
   The rest of "project.do" is divided into sections: the directory creation section, `global 			dirCreate	0`,
the stata package installation section, `global 			pack 		0`, and the building the handbook section, `global			document	0`. Each of these sections can be turned "on" or "off" by changing the 0 to 1 or turned off by turning the 1 to a 0. Sections of the code will only run when they are turned on. Turn "on" `dirCreate` and `pack`.
 
  Now run the project.do.
 
 5. Download the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria, 2012-2013 at https://microdata.worldbank.org/index.php/catalog/1952/get-microdata. You will need to create an account with the World Bank if you do not already have one.
 
 The dataset file is called NGA_2012_GHSP-W2_v02_M_STATA. Extract the entire file of NGA_2012_GHSP-W2_v02_M_STATA and copy or move it to `C:\Users\"username"\git\lsms-isa_data_handbook\data\nigeria\wave_2\raw` - the nigeria\wave_2\raw file path was created by the project.do.
 
 6. Move or copy the file land-conversion.dta from the cloned repository to `C:\Users\"username"\git\lsms-isa_data_handbook\data\nigeria\wave_2\raw`
 
 

## Compiling the guide in Microsoft Word

   "nigeria_handbook.do" compiles the handbook in stata and produces Microsoft word documents. Find "nigeria_handbook.do" at `"C:\Users\"username"\git\lsms-isa_data_handbook\code\nigeria\nigeria_handbook.do"`.
   
   You must first run the "project.do" file at the start of every session working with the "nigeria_handbook.do" file. 
   
   ***The chapter on Yield must be run after all the other chapters have been run, but otherwise the order you run the other files in is not important.***
   
   To generate a chapter in the guide open the "nigeria_handbook.do" and in the "build handbook section" edit and remove the `*` in front of the chapter file path. For instance to generate the chapter on constructing the area you must remove the star `*` infront of   ``` markstat using "$hndk/wave_2/area_construct", docx   ``` then run "nigeria_handbook.do" to produce the chapter. 
   
   Only one chapter may be generated during each run of "nigeria_handbook.do", so you must replace `*` on any chapter file paths which are not in use. 
   
  
