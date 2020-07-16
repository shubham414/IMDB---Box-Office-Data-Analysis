
use IMDB
DROP TABLE IF EXISTS stg_imdb_title_akas;

CREATE TABLE stg_imdb_title_akas (
	titleId varchar(10) not null,
	[ordering] int,
	title varchar(1024),
	region varchar(255),
	[language] varchar(255),
	types varchar(255),
	[attributes] varchar(1024),
	isOriginalTitle varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (titleId, [ordering] )
) ;


-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_basics;

CREATE TABLE stg_imdb_title_basics (
	tconst varchar(10) not null,
	titleType varchar(255),
	primaryTitle varchar(1024),
	originalTitle varchar(1024),
	isAdult bit,
	startYear int,  
	endYear int,   
	runtimeMinutes int,   
	startYear_char varchar(4),  
	endYear_char varchar(4),   
	runtimeMinutes_char varchar(10),   
	genres varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (tconst) 
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_crew

CREATE TABLE stg_imdb_title_crew (
	tconst varchar(10) not null,
	directors varchar(MAX),
	writers varchar(MAX),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (tconst) 
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_episode;

CREATE TABLE stg_imdb_title_episode (
	tconst varchar(10) not null ,
	parentTconst varchar(10),
	seasonNumber int,    
	episodeNumber int,
	seasonNumber_char varchar(10) ,  
	episodeNumber_char varchar(10) ,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (tconst) 
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_principals;

CREATE TABLE stg_imdb_title_principals (
	tconst varchar(10) not null,
	[ordering] int,
	nconst varchar(10),
	category varchar(255),
	job varchar(1024),
	[characters] varchar(1024),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (tconst,[ordering]) 
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_ratings;

CREATE TABLE stg_imdb_title_ratings (
	tconst varchar(10)  not null,
	averageRating real,
	numVotes int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (tconst) 
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_name_basics;

CREATE TABLE stg_imdb_name_basics (
	nconst varchar(10) not null,
	primaryName varchar(255),
	birthYear int, 
	deathYear int,   
	birthYear_char varchar(4),       
	deathYear_char varchar(4),     
	primaryProfession varchar(255),
	knownForTitles varchar(1024),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (nconst) 
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_crew_directors;

CREATE TABLE stg_imdb_title_crew_directors (
	tconst varchar(10) not null,
	nconst varchar(10) not null,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (tconst, nconst) 
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_crew_writers

CREATE TABLE stg_imdb_title_crew_writers (
	tconst varchar(10) not null,
	nconst varchar(10) not null,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (tconst, nconst) 
) ;

-- IMDb Project
-- Staging Tables Expanded
-- Rick Sherman
-- 2020-04-10

-- Drop table

DROP TABLE IF EXISTS STG_box_office_worldwide ;

CREATE TABLE STG_box_office_worldwide (
	box_office_worldwide_sk int NOT NULL IDENTITY(1,1),
	BoxOffice_Rank int,
	tconst varchar(10),
	Title varchar(255),
	Worldwide_LifetimeGross bigint,
	Domestic_LifetimeGross bigint,
	Domestic_Pct real,
	Foreign_LifetimeGross bigint,
	Foreign_Pct real,
    Release_Year  int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (box_office_worldwide_sk)
);


-- Drop table

DROP TABLE IF EXISTS stg_imdb_franchises_gross;

CREATE TABLE stg_imdb_franchises_gross (
                   Franchises_Gross_SK int NOT NULL IDENTITY(1,1),
	Franchise varchar(80),
	Total_Revenue bigint,
	Number_of_Releases int,
	Top_Release varchar(255),
	Lifetime_Gross bigint,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Franchises_Gross_SK)
);

-- Drop table

DROP TABLE IF EXISTS stg_imdb_franchises_list

CREATE TABLE stg_imdb_franchises_list (
                   Franchises_Lists_SK int NOT NULL IDENTITY(1,1),                   
	Franchise varchar(255),
	Realease_Rank int,
	Release_Name varchar(255),
	Lifetime_Gross bigint,
	Max_Theaters int,
	Opening_Gross bigint,
	Open_Theaters int,
	Release_Date datetime,
	Distributor varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Franchises_Lists_SK)
);

-- Drop table

DROP TABLE IF EXISTS stg_imdb_brands_gross;

CREATE TABLE stg_imdb_brands_gross (
                   Brands_Gross_SK int NOT NULL IDENTITY(1,1),
	Brand_Name varchar(80),
	Total_Revenue bigint,
	Number_of_Releases int,
	Top_Release varchar(255),
	Lifetime_Gross bigint,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Brands_Gross_SK)
);

-- Drop table

DROP TABLE IF EXISTS stg_imdb_brands_list

CREATE TABLE stg_imdb_brands_list (
                   Brands_Lists_SK int NOT NULL IDENTITY(1,1),                   
	Brand_Name varchar(255),
	Realease_Rank int,
	Release_Name varchar(255),
	Lifetime_Gross bigint,
	Max_Theaters int,
	Opening_Gross bigint,
	Open_Theaters int,
	Release_Date datetime,
	Distributor varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Brands_Lists_SK)
);


-- Drop table

DROP TABLE if exists stg_iso_country

CREATE TABLE stg_iso_country (
                   Country_SK int NOT NULL IDENTITY(1,1),
	country_name varchar(255),
	alpha_2 varchar(2),
	alpha_3 varchar(3),
	country_code int,
	iso_3166_2 varchar(80),
	region varchar(255),
	sub_region varchar(255),
	intermediate_region varchar(255),
	region_code int,
	sub_region_code int,
	intermediate_region_code int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Country_SK)
);
-- Drop table

DROP TABLE if exists stg_iso_language

CREATE TABLE stg_iso_language (
    Language_SK int NOT NULL IDENTITY(1,1),
	alpha3_b varchar(3),
	alpha3_t varchar(3),
	alpha2 varchar(2),
	Language_Name varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Language_SK)
);

DROP TABLE IF EXISTS STG_box_office_worldwide ;

CREATE TABLE STG_box_office_worldwide (
	box_office_worldwide_sk int NOT NULL IDENTITY(1,1),
	BoxOffice_Rank int,
	tconst varchar(10),
	Title varchar(255),
	Worldwide_LifetimeGross bigint,
	Domestic_LifetimeGross bigint,
	Domestic_Pct real,
	Foreign_LifetimeGross bigint,
	Foreign_Pct real,
    Release_Year  int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (box_office_worldwide_sk)
);


-- Drop table

DROP TABLE IF EXISTS stg_imdb_franchises_gross;

CREATE TABLE stg_imdb_franchises_gross (
                   Franchises_Gross_SK int NOT NULL IDENTITY(1,1),
	Franchise varchar(80),
	Total_Revenue bigint,
	Number_of_Releases int,
	Top_Release varchar(255),
	Lifetime_Gross bigint,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Franchises_Gross_SK)
);

-- Drop table


DROP TABLE IF EXISTS stg_imdb_franchises_list

CREATE TABLE stg_imdb_franchises_list (
                   Franchises_Lists_SK int NOT NULL IDENTITY(1,1),                   
	Franchise varchar(255),
	Realease_Rank int,
	Release_Name varchar(255),
	Lifetime_Gross bigint,
	Max_Theaters int,
	Opening_Gross bigint,
	Open_Theaters int,
	Release_Date datetime,
	Distributor varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Franchises_Lists_SK)
);

-- Drop table

DROP TABLE IF EXISTS stg_imdb_brands_gross;

CREATE TABLE stg_imdb_brands_gross (
                   Brands_Gross_SK int NOT NULL IDENTITY(1,1),
	Brand_Name varchar(80),
	Total_Revenue bigint,
	Number_of_Releases int,
	Top_Release varchar(255),
	Lifetime_Gross bigint,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Brands_Gross_SK)
);

-- Drop table

DROP TABLE IF EXISTS stg_imdb_brands_list

CREATE TABLE stg_imdb_brands_list (
                   Brands_Lists_SK int NOT NULL IDENTITY(1,1),                   
	Brand_Name varchar(255),
	Realease_Rank int,
	Release_Name varchar(255),
	Lifetime_Gross bigint,
	Max_Theaters int,
	Opening_Gross bigint,
	Open_Theaters int,
	Release_Date datetime,
	Distributor varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Brands_Lists_SK)
);


-- Drop table

DROP TABLE if exists stg_iso_country

CREATE TABLE stg_iso_country (
                   Country_SK int NOT NULL IDENTITY(1,1),
	country_name varchar(255),
	alpha_2 varchar(2),
	alpha_3 varchar(3),
	country_code int,
	iso_3166_2 varchar(80),
	region varchar(255),
	sub_region varchar(255),
	intermediate_region varchar(255),
	region_code int,
	sub_region_code int,
	intermediate_region_code int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Country_SK)
);
-- Drop table

DROP TABLE if exists stg_iso_language

CREATE TABLE stg_iso_language (
    Language_SK int NOT NULL IDENTITY(1,1),
	alpha3_b varchar(3),
	alpha3_t varchar(3),
	alpha2 varchar(2),
	Language_Name varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Language_SK)
);

DROP TABLE IF EXISTS stg_numbers_daily_box_office ;
CREATE TABLE stg_numbers_daily_box_office  (
	daily_box_office_sk int NOT NULL IDENTITY(1,1),

	Movie_Name varchar(255) not null,
	Show_Date datetime not null,
	Daily_Rank int null,
	Daily_Gross bigint null,
    Daily_Change_Pct decimal(10,3) null,
    Weekly_Change_Pct decimal(10,3) null,
	Number_of_Theaters int null,
	Gross_Per_Theater bigint null,
	Total_Gross bigint null,
	Number_of_Days int null,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (daily_box_office_sk)
);

drop table if exists stg_numbers_frachise_movies_box_office
CREATE TABLE stg_numbers_frachise_movies_box_office  (
	frachise_movies_box_office_sk int NOT NULL IDENTITY(1,1),

	Franchise varchar(255) not null,
	Release_Date datetime not null,
	Movie_Name varchar(255) not null,
	Production_Budget bigint null,
	Opening_Weekend bigint null,
	Domestic_Box_Office bigint null,
	Worldwide_Box_Office bigint null,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (frachise_movies_box_office_sk)
);

drop table if exists  stg_numbers_frachise_all_box_office
CREATE TABLE stg_numbers_frachise_all_box_office  (
	frachise_all_box_office_sk int NOT NULL IDENTITY(1,1),

	Franchise varchar(255) not null,
	No_of_Movies	int  not null,
	Domestic_Box_Office	bigint  not null,
	Infl_Adj_Dom_Box_Office	bigint  not null,
	Worldwide_Box_Office	bigint  not null,
	First_Year	int  not null,
	Last_Year	int  not null,
	No_of_Years	int not null,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (frachise_all_box_office_sk)
);



DROP TABLE IF EXISTS stg_imdb_name_basics_knownForTitles ;

CREATE TABLE stg_imdb_name_basics_knownForTitles (
	knownForTitles_sk int NOT NULL IDENTITY(1,1),
	nconst varchar(255),
	knownForTitles varchar(1024),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (knownForTitles_sk)
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_name_basics_primaryProfession ;

CREATE TABLE stg_imdb_name_basics_primaryProfession (
	primaryProfession_sk int NOT NULL IDENTITY(1,1),
	nconst varchar(255) NOT NULL,
	primaryProfession varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (primaryProfession_sk)
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_basics_genres 

CREATE TABLE stg_imdb_title_basics_genres (
	title_basics_genres_sk int NOT NULL IDENTITY(1,1),
	tconst varchar(255),
	genres varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_basics_genres_sk)
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_crew_directors ;

CREATE TABLE stg_imdb_title_crew_directors (
	title_crew_directors_sk int NOT NULL IDENTITY(1,1),
	tconst varchar(10) NOT NULL,
	nconst varchar(10) NOT NULL,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_crew_directors_sk)
) ;


-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_crew_writers ;

CREATE TABLE stg_imdb_title_crew_writers (
	stg_imdb_title_crew_writers_sk int NOT NULL IDENTITY(1,1),
	tconst varchar(10) NOT NULL,
	nconst varchar(10) NOT NULL,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (stg_imdb_title_crew_writers_sk)
) ;


DROP TABLE IF EXISTS stg_ml_movies ;

CREATE TABLE  stg_ml_movies (
	movieId int,
	title varchar(255),
	genres varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (movieId)
) ;
use stg_ML
-- Drop table
 DROP TABLE IF EXISTS stg_ml_links ;

CREATE TABLE  stg_ml_links (
	movieId int,
	imdbId varchar(20),
	tmdbId int,
	tconst varchar(20),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (movieId)
) ;


-- Drop table
 DROP TABLE IF EXISTS stg_ml_ratings ;

CREATE TABLE  stg_ml_ratings (
	userId int,
	movieId int,
	rating real,
	ratings_timestamp int,
                   ratings_datetime datetime,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (userId,movieId)
) ;


-- Drop table
 DROP TABLE IF EXISTS stg_ml_tags ;

CREATE TABLE  stg_ml_tags (	
                   ml_tags_sk int NOT NULL IDENTITY(1,1),
	userId int,
	movieId int,
	tag varchar(255),
	ratings_timestamp int,
                   ratings_datetime datetime,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (ml_tags_sk )
) ;

-- Drop table

 DROP TABLE IF EXISTS stg_ml_genome_scores ;

CREATE TABLE  stg_ml_genome_scores (
	movieId int,
	tagId int,
	relevance real,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (movieId,tagId)
) ;


-- Drop table
 DROP TABLE IF EXISTS stg_ml_genome_tags ;

CREATE TABLE  stg_ml_genome_tags (
	tagId int,
	tag varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (tagid)
) ;


DROP TABLE IF EXISTS stg_numbers_daily_box_office ;
CREATE TABLE stg_numbers_daily_box_office  (
	daily_box_office_sk int NOT NULL IDENTITY(1,1),

	Movie_Name varchar(255) not null,
	Show_Date datetime not null,
	Daily_Rank int null,
	Daily_Gross bigint null,
    Daily_Change_Pct decimal(10,3) null,
    Weekly_Change_Pct decimal(10,3) null,
	Number_of_Theaters int null,
	Gross_Per_Theater bigint null,
	Total_Gross bigint null,
	Number_of_Days int null,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (daily_box_office_sk)
);

drop table if exists stg_numbers_frachise_movies_box_office
CREATE TABLE stg_numbers_frachise_movies_box_office  (
	frachise_movies_box_office_sk int NOT NULL IDENTITY(1,1),

	Franchise varchar(255) not null,
	Release_Date datetime not null,
	Movie_Name varchar(255) not null,
	Production_Budget bigint null,
	Opening_Weekend bigint null,
	Domestic_Box_Office bigint null,
	Worldwide_Box_Office bigint null,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (frachise_movies_box_office_sk)
);

drop table if exists  stg_numbers_frachise_all_box_office
CREATE TABLE stg_numbers_frachise_all_box_office  (
	frachise_all_box_office_sk int NOT NULL IDENTITY(1,1),

	Franchise varchar(255) not null,
	No_of_Movies	int  not null,
	Domestic_Box_Office	bigint  not null,
	Infl_Adj_Dom_Box_Office	bigint  not null,
	Worldwide_Box_Office	bigint  not null,
	First_Year	int  not null,
	Last_Year	int  not null,
	No_of_Years	int not null,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (frachise_all_box_office_sk)
);
