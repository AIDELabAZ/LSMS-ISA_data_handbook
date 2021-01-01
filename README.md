# lsms-isa_data_handbook
## LSMS-ISA Processed Dataset Construction and Documentation

The data handbook is an annotated code book about the steps to clean the LSMS-ISA data and make a household agricultural production dataset. The ag production dataset is designed to estimate agricultural production functions at the household level. We created 6 preliminary guide documents detailing the making of agricultural inputs and outputs datasets, these are the area cultivated, the crop output value and weight, irrigation, pesticide and herbicide, fertilizer and labor. A final file explains how to combine the preliminary documents and make a dataset ready to estimate yield production functions.

##  Getting Started: Setting Up A Dev Environment

The code runs when the raw and cleaned data exist in a specific file structure which is created after running the "project.do" which is available from the git repository. The steps below will demonstrate how to get the project.do, set up the dev environment, get the raw data.

### Steps:

1. Download and install pandoc at https://pandoc.org/installing.html. We use pandoc to compile the code into a word document.

2. Download a local copy of the code (clone the repository)
   
  Open Github desktop. From the file drop down menu select `clone repository...`. In the `clone repository` menu select the `URL` tab and paste this url or the username/repository_name in the textbox.
  
   ```sh 
  https://github.com/jdavidm/lsms-isa_data_handbook or jdavidm/lsms-isa_data_handbook
   ```
 3. Open the project.do
 
   Find on your local drive the "git" folder such as "\user\git\lsms-isa_data_handbook\projectdo.do". Open the "lsms-isa_data_handbook" in the git folder. Open "project.do" in stata.
   
 4. Edit the project.do
 
   The "project.do" will create a set of files on your local computer where you will store the raw data and where the clean data will be stored. You will have to change the location/user portion of the project.do code. These edits are specific to the user and will allow the do file to create the project files in your local computer.
   
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
   
 5. Download the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria, 2012-2013 at https://microdata.worldbank.org/index.php/catalog/1952/get-microdata. Move the downloaded file to `C:\Users\"username"\git\lsms-isa_data_handbook\data\nigeria\wave_2\raw`

## Running the code

   Find the file which creates the handbook at `"C:\Users\"username"\git\lsms-isa_data_handbook\code\nigeria\nigeria_handbook.do"`. This file creates the word documents that guide the making of the clean data. Before running the "nigeria_handbook.do" file you must run the project.do. To generate a chapter you will have to edit the "nigeria_handbook.do". You select to generate the chapter in the `build handbook` section of the "nigeria_handbook.do". The sections are commented out, to generate a chapter remove the comment marks from the chapter you would like to read one at a time. Yield must be run after all other chapters have been run, but otherwise the order you run the other files in is not important.
