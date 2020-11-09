# LSMS-ISA Dataset Construction Handbook

The Living Standards Measurement Study - Integrated Surveys on Agriculture (LSMS-ISA) project is an initiative, funded by the Bill & Melinda Gates Foundation (BMGF), led by the Living Standards Measurement Study (LSMS) within the Development Economics Data Group (DECDG) at the World Bank. Under the LSMS-ISA initiative, the World Bank supports governments in seven Sub-Saharan African countries to generate household panel data with a strong focus on agriculture and modeled on the integrated household survey design of the Living Standards Measurement Study. In addition to the goal of producing policy-relevant agricultural data, the LSMS-ISA supports the design and validation of innovative survey methods, the use of technology for improving survey data quality, and the development of analytical tools to facilitate the use and analysis of the data collected.

This repository provides curated Stata code and documentation to allow users to process the publicly-available LSMS-ISA-supported survey rounds in order to contruct harmonized datasets ready for analysis.

# Setting Up the Dev Environment with Github

The variable guides that we have made available on the github repository work in a github and local environment which we must first set up. This involves cloning the git repository where the code guides live on your local. 

1. Download a copy of the code by cloning the github repository

Click "code" above the files listed in the repository and select "Open with Github Desktop". Allow Github to open if you are prompted to do so. An option window called clone a repository will come up. Click the URL tab if you are not on the URL tab. In the URL tab there are two bars, the first bar has the Repository URL or github username and repository, and the second tab has the local path that the repository will be copied to, there is a default local path but if there is another path you would prefer, and its up to you, you can click "choose" next to the local path window and set your own path. Once you have chosen you path you can click clone.

The repository is now cloned to your local.

2. Access the cloned folders whereever they are stored in your local and open the project.do file and run that file in stata. This file creates the folders and installs the programs pandoc and pdflatex which you will need to run the guides properly.

3. Download the data from the world bank website.

To access the data from the World Bank website go the Central data catalog on the world bank website, then find the "filter by collection on the left hand side of the webpage" and select checkbox for the Living Standards Measurement Survey (LSMS) filter. LSMS surveys are catergorized alphabetically by country names and then chronologically by the year and wave of the survey. Browse the pages until you find the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria, 2012-2013, select that. Under the heading there are four tabs called STUDY DESCRIPTION, DOCUMENTATION, DATA DESCRIPTION, and GET MICRODATA, click on the GET MICRODATA tab. You will be asked to log in with World Bank user profile, which if you do not already have a profile you will be redirected to creat one, follow the instructions to create a profile and then repeat the steps to find the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria. If you already have a profile you will be redirected to a form submission page where you must write in the box provided a brief description of the research project that will use the data, which once you have submitted you will be redirected to the data files that are available for download in SPSS, CSV, and STATA formats. To follow this guide select the STATA format. Once the download is complete open the compressed zip file "NGA_2012_GHSP-W2_v02_M_STATA".

Go into the post harvest wave 2 file, then agriculture file, then copy all stata datasets and paste them in the nigeria wave 2 raw data folder that was created by the project do, and the path is "C:\Users\emilk\git\lsms-isa_processed_dataset\data\nigeria\wave_2\raw".

Open "NGA_2012_GHSP-W2_v02_M_STATA" again and open post planting wave 2, agriculture, and then copy all the stata datasets and paste them in the nigeria wave 2 raw data folder that was created by the project do, and the path is "C:\Users\emilk\git\lsms-isa_processed_dataset\data\nigeria\wave_2\raw".
