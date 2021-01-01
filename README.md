# lsms-isa_data_handbook
## LSMS-ISA Processed Dataset Construction and Documentation

The data handbook is an annotated code book about the steps to clean the LSMS-ISA data and make a household agricultural production dataset. The ag production dataset is designed to estimate agricultural production functions at the household level. We created 6 preliminary guide documents detailing the making of agricultural inputs and outputs datasets, these are the area cultivated, the crop output value and weight, irrigation, pesticide and herbicide, fertilizer and labor. A final file explains how to combine the preliminary documents and make a dataset ready to estimate yield production functions.

##  Getting Started: Setting Up A Dev Environment

### Steps:

1. Download a local copy of the code (clone the repository)
   
  Open Github desktop. From the file drop down menu select `clone repository...`. In the `clone repository` menu select the `URL` tab and paste this url or the username/repository_name in the textbox.
  
   ```sh 
  https://github.com/jdavidm/lsms-isa_data_handbook or jdavidm/lsms-isa_data_handbook
   ```
  

  
   git clone git@github.com:EvansSchoolPolicyAnalysisAndResearch/375-AgQuery.git
   ```
We combine the preliminary documents  The (kilograms of maize per hectare) from the Nigeria General Household Survey, Panel 2012-2013, Wave 2 (Survey ID Number: NGA_2012_GHSP-W2_v02_M). The basic steps we take here are the same steps you could take to generate yield variables in other waves and for other crops. This guide includes the stata commands but not the stata output. It is helpful to replicate the code yourself so you can see the output copying the code yourself and  the steps on your own is helpful. To use the same files we use in this guide download the Nigeria General Household Survey, Panel 2012-2013, Wave 2 (Survey ID Number: NGA_2012_GHSP-W2_v02_M) from the World Bank website's Central Data catalog - instructions are given below on how to find and download the files from the World Bank website.

# Instructions on Downloading the Data from the World Bank Website

To access the data from the World Bank website go the Central data catalog on the world bank website, then find the "filter by collection on the left hand side of the webpage" and select checkbox for the Living Standards Measurement Survey (LSMS) filter. LSMS surveys are catergorized alphabetically by country names and then chronologically by the year and wave of the survey. Browse the pages until you find the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria, 2012-2013, select that. Under the heading there are four tabs called STUDY DESCRIPTION, DOCUMENTATION, DATA DESCRIPTION, and GET MICRODATA, click on the GET MICRODATA tab. You will be asked to log in with World Bank user profile, which if you do not already have a profile you will be redirected to creat one, follow the instructions to create a profile and then repeat the steps to find the General Household Survey, Panel 2012-2013, Wave 2 for Nigeria. If you already have a profile you will be redirected to a form submission page where you must write in the box provided a brief description of the research project that will use the data, which once you have submitted you will be redirected to the data files that are available for download in SPSS, CSV, and STATA formats. To follow this guide select the STATA format. Once the download is complete open the compressed zip file "NGA_2012_GHSP-W2_v02_M_STATA", and navigate to Post Harvest Wave 2, Agriculture, and select the file sect3a_harvestw2.dta. Keep the raw data files and the cleaned data files separate so it is a good idea to duplicate sect3a_harvestw2 in another folder where you will work on it from there, this way you can always refer to the original raw data file in the original NGA_2012_GHSP-W2_v02_M_STATA file if you need to.
