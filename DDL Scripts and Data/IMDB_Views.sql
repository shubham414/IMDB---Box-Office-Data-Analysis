CREATE VIEW VW_IMDB_BO_Movies  
AS  
SELECT   
 T.title_sk, T.primaryTitle, T.runtimeMinutes, T.startYear, TT.titleType, G.genres, N.primaryName, J.job_category  
 ,BO.Release_Year,BO.BoxOffice_Rank, BO.Worldwide_LifetimeGross, BO.Domestic_LifetimeGross, BO.Foreign_LifetimeGross  
FROM dim_imdb_title_basics T  
INNER JOIN fct_movies_box_office_worldwide BO ON BO.title_sk = T.title_sk  
LEFT JOIN dim_imdb_titleType TT ON TT.titleType_sk = T.titleType_sk  
INNER JOIN dim_imdb_title_principals P ON P.title_sk = T.title_sk  
INNER JOIN dim_imdb_name_basics N ON N.name_sk = P.name_sk  
INNER JOIN dim_imdb_job_category J ON J.job_category_sk = P.job_category_sk  
INNER JOIN dim_imdb_title_basics_genres TG ON TG.title_sk = T.title_sk  
INNER JOIN dim_imdb_genres G ON G.genres_sk = TG.genres_sk  
WHERE J.job_category IN ('actor','director','actress', 'writer')  
GROUP BY  
 T.title_sk, T.primaryTitle, T.runtimeMinutes, T.startYear, TT.titleType, G.genres, N.primaryName, J.job_category  
 ,BO.Release_Year,BO.BoxOffice_Rank, BO.Worldwide_LifetimeGross, BO.Domestic_LifetimeGross, BO.Foreign_LifetimeGross 
 
GO




CREATE VIEW VW_IMDB_Movies  
AS  
SELECT  
 T.title_sk, T.primaryTitle, T.runtimeMinutes, T.startYear, TT.titleType, G.genres, N.primaryName, J.job_category, B.Release_Date, B.release_Rank, B.Lifetime_Gross  
 ,BO.BoxOffice_Rank, BO.Worldwide_LifetimeGross  
FROM dim_imdb_title_basics T  
INNER JOIN dim_imdb_titleType TT ON TT.titleType_sk = T.titleType_sk  
INNER JOIN dim_imdb_title_basics_genres TG ON TG.title_sk = T.title_sk  
INNER JOIN dim_imdb_genres G ON G.genres_sk = TG.genres_sk  
INNER JOIN dim_imdb_title_principals P ON P.title_sk = T.title_sk  
INNER JOIN dim_imdb_name_basics N ON N.name_sk = P.name_sk  
INNER JOIN dim_imdb_job_category J ON J.job_category_sk = P.job_category_sk  
LEFT JOIN fct_imdb_brands_list B ON B.title_sk = t.title_sk  
LEFT JOIN fct_movies_box_office_worldwide BO ON BO.title_sk = T.title_sk  
WHERE J.job_category IN ('actor','director','actress', 'writer')  
 AND N.primaryName IN (  
 'John Cusack','Ana de Armas','Rian Johnson','Daisy Ridley','Samuel L. Jackson','J.J. Abrams','Kathryn Bigelow','Nicolas Cage','Scarlett Johansson','Dwayne Johnson','Emilia Clarke'  
,'Woody Harrelson','Idris Elba','Sean Connery','Gal Gadot'  
 )  
GROUP BY  
 T.title_sk, T.primaryTitle, T.runtimeMinutes, T.startYear, TT.titleType, G.genres, N.primaryName, J.job_category, B.Release_Date, B.release_Rank, B.Lifetime_Gross  
 ,BO.BoxOffice_Rank, BO.Worldwide_LifetimeGross  
 
GO



  
CREATE VIEW VW_ML_MovieRatings  
AS  
  
with cte as  
(  
 select title_sk, AVG(rating) as avg_rating from fct_ml_ratings  
 group by title_sk  
)  
SELECT  
 B.title_sk, B.ml_title, R.avg_rating, TG.genres_sk, G.genres, IR.averageRating, BO.Worldwide_LifetimeGross  
FROM dim_imdb_title_basics B  
INNER JOIN cte R ON R.title_sk = B.title_sk  
INNER JOIN dim_imdb_title_basics_genres TG ON TG.title_sk = R.title_sk  
INNER JOIN dim_imdb_genres G ON G.genres_sk = TG.genres_sk  
INNER JOIN fct_imdb_title_ratings IR ON IR.title_sk = B.title_sk  
LEFT JOIN fct_movies_box_office_worldwide BO ON BO.title_sk = IR.title_sk  
GROUP BY B.title_sk, B.ml_title,R.avg_rating, TG.genres_sk, G.genres, genre_source, IR.averageRating, BO.Worldwide_LifetimeGross  
  
GO