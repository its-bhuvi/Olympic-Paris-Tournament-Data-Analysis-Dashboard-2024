use olympic;
select * from medals;
SELECT * FROM athletes;
SELECT * FROM events;
# ---------------------------------------------------------------------- Data Analysis -------------------------------------------

#  How many number of Medals are there?
select count(*) from medals;

# How many gold medals win?
SELECT count(medal_type) FROM medals where medal_type= 'Gold Medal';

# How many Silver medals win?
SELECT count(medal_type) FROM medals where medal_type= 'Silver Medal';

# How many Bronze medals win?
SELECT count(medal_type) FROM medals where medal_type= 'Bronze Medal';

# How many country are particpated in the tounament?
SELECT COUNT(DISTINCT country) FROM athletes;

# How many Sports are play in the tounament?
SELECT COUNT(distinct discipline) FROM medals;

# How many are athlets are participated in the tounament?
SELECT COUNT(DISTINCT name) FROM athletes;

# Which of the county is perform well in the tounament?
WITH MedalCounts AS 
(   SELECT country, COUNT(*) AS Total_medals     
	FROM medals     
	GROUP BY country ), 
MaxMedalCount AS 
(     SELECT MAX(Total_medals) AS Max_medals     
	  FROM MedalCounts ) SELECT country 
      FROM MedalCounts 
      WHERE Total_medals = (SELECT Max_medals FROM MaxMedalCount);
      
# ------------------OR --------------------------------------
SELECT country FROM medals GROUP BY country ORDER BY COUNT(*) DESC LIMIT 1;

# Top 5 high performer Country with medals count ?
SELECT country, COUNT(*) AS Total_medals FROM medals GROUP BY country ORDER BY Total_medals DESC LIMIT 5;

# How many events are play in the tounament?
SELECT COUNT( event) FROM events;


