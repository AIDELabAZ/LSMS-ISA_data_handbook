# lsms-isa_data_handbook
## LSMS-ISA Processed Dataset Construction and Documentation

The data handbook is an annotated code book listing and explaining the procedures used to clean and prepare the LSMS-ISA data and make a household agricultural production dataset. The ag production dataset is designed to estimate agricultural production functions at the household level. There are 6 preliminary guide documents on the making of datasets for fertilizer, harvest labor, planting labor, crop output, pesticide-herbicide-fungicide-irrigation, and land area. There is a final file called "yield" which combines the preliminary datasets to make a dataset ready to estimate yield production functions.

This guide combines the code, the explanations of the code, and the output in a single file. The user generates the guide by running a stata do file that runs the code on the data and compiles the results and the explanations into a single document. To compile the guide please follow the steps below.

##  Getting Started: Setting Up A Dev Environment

The git repository contains the guide document code, "nigeria_handbook.do" for compiling the guide documents, and a "project.do" to set the file path for "nigeria_handbook.do" and the raw data from the World Bank. Before we run "nigeria_handbook.do" we must duplicate the git repository on our local computer and set up the empty files that will contain the raw data.

### Steps:

1. Download a local copy of the code (clone the repository)
   
  Open Github desktop. From the file drop down menu select `clone repository...`. In the `clone repository` menu select the `URL` tab and paste and this url or username/repository_name in the box.
  
   ```sh 
  https://github.com/jdavidm/lsms-isa_data_handbook or jdavidm/lsms-isa_data_handbook
   ```
   After the repository has been located select the `clone repository` button.
   
 2. Open the project.do
 
   Locate and open  the "project.do" in the "lsms-isa_data_handbook" file in the "git" folder.
   
 3. Edit the project.do
 
   The "project.do" creates a local file directory to store the raw datasets and the cleaned dataset. We have to do a bit of path editing on "project.do" to  work with your unique local username. You will have to edit the "location/user" section of the "project.do" code to read specifically for your local computer. The edits are specific to the user and will allow the do file to create the project files in your local computer.
   
   There are 5 sections in the file. The first section called "setup" is an index where you can turn "on" or "off" the directory creation section, `global 			dirCreate	0`,
the stata package installation section, `global 			pack 		0`, and the building the handbook section, `global			document	0`. Each of these sections can be turned on by changing the 0 to 1 or turned off by turning the 1 to a 0. Before we turn on or off the sections we must set the global.

   Past this code block on line 68 and replace "emilk" with your unique username.
   
    ```sh
       if `"`c(username)'"' == "emilk" {	
        global 		project  	"C:/Users/emilk/git/lsms-isa_data_handbook"	
		
		* tell Stata where to find the relevant programs
		whereis pdflatex 		"C:/Program Files/MiKTeX/miktex/bin/x64/pdflatex.exe"
		whereis pandoc 			"C:/Users/emilk/AppData/Local/Pandoc/pandoc.exe"
    }
    ```
 
   In the index section turn on `dirCreate` and `pack`.
   
   Now run the project.do.
   
 4. Download the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria, 2012-2013 at https://microdata.worldbank.org/index.php/catalog/1952/get-microdata. Move the downloaded file to `C:\Users\"username"\git\lsms-isa_data_handbook\data\nigeria\wave_2\raw`
 
 5. Download and install pandoc at https://pandoc.org/installing.html. We use pandoc to compile the code into a word document.

## Running the code

   Find the file which creates the handbook at `"C:\Users\"username"\git\lsms-isa_data_handbook\code\nigeria\nigeria_handbook.do"`. This file creates the word documents that guide the making of the clean data. Before running the "nigeria_handbook.do" file you must run the project.do. To generate a chapter you will have to edit the "nigeria_handbook.do". You select to generate the chapter in the `build handbook` section of the "nigeria_handbook.do". The sections are commented out, to generate a chapter remove the comment marks from the chapter you would like to read one at a time. Yield must be run after all other chapters have been run, but otherwise the order you run the other files in is not important.
