# LSMS-ISA Dataset Construction Handbook

The [Living Standards Measurement Study - Integrated Surveys on Agriculture (LSMS-ISA)](https://www.worldbank.org/en/programs/lsms/initiatives/lsms-ISA) project is an initiative, funded by the [Bill & Melinda Gates Foundation (BMGF)](https://www.gatesfoundation.org/), led by the Living Standards Measurement Study (LSMS) within the Development Economics Data Group (DECDG) at the World Bank. Under the LSMS-ISA initiative, the World Bank supports governments in seven Sub-Saharan African countries to generate household panel data with a strong focus on agriculture and modeled on the integrated household survey design of the Living Standards Measurement Study.

This repository provides curated Stata code and documentation to introduce users on how to process the publicly-available LSMS-ISA-supported survey rounds in order to contruct harmonized datasets ready for analysis. The **LSMS-ISA Data Handbook** is constructed using dynamic documents constructed in Stata using [`markstat`](https://data.princeton.edu/stata/markdown/gettingStarted). The Microsoft Word versions of these documents are directly available in this repository. However, the repo is designed in such a way as to allow the user to download the repo (and any other necessary programs), and create the documents themself. This allows the user to follow along in the code and dynamically adapt the document to explore the data and code.

# Setting Up the Dev Environment with Github

The variable guides that we have made available on the github repository work in a github and local environment which we must first set up. This involves cloning the git repository where the code guides live on your local. 

## 1. Download a copy of the code by cloning the github repository

In the repository click "code" and select either **`Clone`, `Open with Github Desktop`, or `Download ZIP`**. Clone or unzip the repository in a directory of your choice.

## 2. Install pandoc and pdflatex

To create the handbook on your own computer, you need to have pandoc and pdflatex install on your machine.

- [pandoc](https://pandoc.org/installing.html)
- [TeX/LaTeX](https://miktex.org/download)

Once these two programs are installed, find out where there are.

- On Windows: type `where pdflatex` and `where pandoc` on the command line
- On Mac or Linux: open `terminal` and type `which pdflatex` and `which pandoc`

## 3. Set up workspace

Access the repository where ever your placed it on your local maching and open the `project.do` file. This file creates a folder structure that is identical across users so that all code will run on any machine where it is installed. Before running the code for the first time, ensure `dirCreate` and `pack` are set to 1.

```{s}
* set $dirCreate to 0 to skip directory creation
	global			dirCreate	1

* set $pack to 0 to skip package installation
	global			pack		1
```	

This will ensure Stata creates the necessary folders and installs all necessary user written Stata packages. Next, ensure that the global `project` is set to the location in which you installed the git repository. If you installed the repo in git's default location, this simply requires changing `{username}` to your computer's username.

```{s}
* define root folder globals
	if `"`c(username)'"' == "{username}" {
		global		project		"C:/Users/{username}/git/lsms-isa_data_handbook"
		
		* tell Stata where to find the relevant programs
		whereis pdflatex		"C:/Program Files/MiKTeX/miktex/bin/x64/pdflatex.exe"
		whereis pandoc			"C:/Program Files/Pandoc/pandoc.exe"
    }
```
Finally, make sure you have the correct paths for `pdflatex` and `pandoc`. How to locate these paths is explained above.
  
## 4. Download the data from the World Bank website

To access the data from the World Bank website go the Central data catalog on the world bank website, then find the "filter by collection on the left hand side of the webpage" and select checkbox for the Living Standards Measurement Survey (LSMS) filter. LSMS surveys are catergorized alphabetically by country names and then chronologically by the year and wave of the survey. Browse the pages until you find the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria, 2012-2013, select that. Under the heading there are four tabs called STUDY DESCRIPTION, DOCUMENTATION, DATA DESCRIPTION, and GET MICRODATA, click on the GET MICRODATA tab. You will be asked to log in with World Bank user profile, which if you do not already have a profile you will be redirected to creat one, follow the instructions to create a profile and then repeat the steps to find the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria. If you already have a profile you will be redirected to a form submission page where you must write in the box provided a brief description of the research project that will use the data, which once you have submitted you will be redirected to the data files that are available for download in SPSS, CSV, and STATA formats. To follow this guide select the STATA format. Once the download is complete open the compressed zip file "NGA_2012_GHSP-W2_v02_M_STATA".

Go into the post harvest wave 2 file, then agriculture file, then copy all stata datasets and paste them in the nigeria wave 2 raw data folder that was created by the project do, and the path is "C:\Users\emilk\git\lsms-isa_processed_dataset\data\nigeria\wave_2\raw".

Open "NGA_2012_GHSP-W2_v02_M_STATA" again and open post planting wave 2, agriculture, and then copy all the stata datasets and paste them in the nigeria wave 2 raw data folder that was created by the project do, and the path is "C:\Users\emilk\git\lsms-isa_processed_dataset\data\nigeria\wave_2\raw".
