----- First business problems
----1. Count the number of movies vs TV shows;
Select * from netflix;
Select type,
count(*) as total_content
from netflix
group by type;
----2. Find the most common rating for movies and TV shows;
select type, rating FROM 
(SELECT type , 
rating,
count(*),
rank () over (partition by type order by count(*) DESC) as max_rating
from netflix
group by 1,2) as table1
where max_rating = 1;
--3 list all the movies that has released in a specific year (e.g. 2020);
select  title, release_year
from netflix
where type ='Movie' AND 
release_year = 2020;
--- Find the top 5 countries with the most content on netflix;
Select * from netflix;
SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(country, ',', n.n), ',', -1) AS new_country,
    COUNT(show_id) AS total_content
FROM 
    netflix
JOIN 
    (SELECT 1 AS n 
     UNION ALL SELECT 2 
     UNION ALL SELECT 3 
     UNION ALL SELECT 4 
     UNION ALL SELECT 5) n
ON 
    CHAR_LENGTH(country) - CHAR_LENGTH(REPLACE(country, ',', '')) >= n.n - 1
GROUP BY 
    new_country
Order by 2 desc
limit 5;
-----5. The longest movies;
select * from netflix;
select distinct title, duration from netflix
where type = 'Movie'
order by duration desc
limit 1;
-----6. Find all the movies/ TV by director 'Kirsten Johnson';
Select *
from netflix 
where director like '%Kirsten Johnson%';
------ 7. List all TV shows with more than 5 seasons;
select * from netflix
where type = 'TV Show' 
And 
duration > '5season';
----- 8. Count the number of content items in each genre;
SELECT 
    SUBSTRING_INDEX(listed_in, ',', 1) AS first_category,
    count(show_id) as total_content
FROM 
    netflix
    group by 1
	limit 1000;
---- 9. Find each year and the average number of content released by India on Netflix return top year with highest avg content release;
Select * from netflix;
SELECT 
    release_year, 
    COUNT(show_id) AS total_content_released
FROM 
    netflix
WHERE 
    country = 'India'
GROUP BY 
    release_year
ORDER BY 
    total_content_released DESC
LIMIT 1;

-----10. List  all movies that are do cumentaries;
select * from netflix
where listed_in like '%documentaries%';

----11. Find all content without a directors;
Select * from netflix
where director is null;

