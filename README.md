# IMDB Data Analysis Pipeline

## Objective:
The aim of the project is to integrate and analyse data coming from the multiple sources such as IMDB, MoviesLens, The Numbers and BoxOffice Mojo.com based on movies/cast/box office revenues, movie brands and franchises. We utilized multiple features of the Talend and SQL server to optimize the complete ETL process.
We then visualized the integrated data on tableau and Power BI to provide valuable insights like revenue share, ratings, geographical contribution to worldwide gross of movies etc.

## Dataset Links:
These files(.csv, .tsv) are Staging data that you need to give as a input to fill staging tables through talend.
https://drive.google.com/drive/folders/1FX1-874Df8oOCg5YqEPSSf4PuUAfj9Ip?usp=sharing

## Technologies Used:
ER/ Studio <br />
SQL server Developer Edition <br />
Microsoft SQL server Management Studio <br />
Talend Real-Time Data Platform 7.1 <br />
Tableau Desktop <br />
Microsoft PowerBI <br />
 

## Code Walkthrough:

Step 1 : Run following script in SSMS to setup the staging database <br />
SQL Script - Staging IMDB tables.sql

Step 2 : Open Talend -> Import Talend Jobs.zip -> Setup your database connections and input file connections <br />
When the connections are successful, Run Master Job. <br />
Master job is located at following path in imported project:- <br />
IMDB/IMDB/IMDB/master_job_complete <br />

Step 3 : Master job will take 75 or more minutes based on your system performance. <br />
Once Job is completed, You can connect respective database to Tableau and Power BI files to visualize dashboards.

## Talend Master Job:

<img width="1537" alt="Talend Master Job" src="https://user-images.githubusercontent.com/59700753/87863963-de649100-c92f-11ea-8ad0-9ff87d2dbe35.png">

## Tableau Dashboard:

![Dashboard](https://user-images.githubusercontent.com/59700753/87863884-b6286280-c92e-11ea-8b32-eda3e22b1dcc.png)

## Power BI Visualization Sample:

![PowerBI_VotesByTitle](https://user-images.githubusercontent.com/59700753/87863981-1ff53c00-c930-11ea-8a52-603e5eb13fb8.png)



## References:

https://datasets.imdbws.com/

https://www.boxofficemojo.com/franchise/?ref_=bo_nb_fr_secondarytab

https://www.boxofficemojo.com/brand/?ref_=bo_nb_frs_secondarytab

https://grouplens.org/datasets/movielens/

https://www.the-numbers.com/movies/franchises

https://www.the-numbers.com/movies/franchise/Marvel-Cinematic-Universe#tab=summary

https://www.the-numbers.com/movie/Avengers-The-(2012)#tab=box-office

https://elearning.tableau.com/

https://www.talend.com/


