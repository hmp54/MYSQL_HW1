
/*NO. 2*/
SELECT MIN(price), MAX(price), AVG(price) 
FROM CD;


/*NO. 3*/
SELECT COUNT(*) AS '# OF TITLES CONTAINING FADO + IS TYPE JAZZ' 
FROM CD 
WHERE title LIKE '%Fado%' AND type LIKE 'Jazz%'; 


/*NO. 4*/
SELECT b.producer 
FROM CDTracks a, CD b 
WHERE a.num = b.num AND song_name LIKE 'Let It Be%'; 


/*NO. 5*/
SELECT type 
FROM MusicType 
WHERE type NOT IN (SELECT distinct(Type) FROM CD); 


/*NO. 6*/
SELECT Type, COUNT(*) AS 'Total # of CDs' 
FROM CD 
GROUP BY Type;  



/* NO. 7 Which Classical CDs are less than 40 minutes? (Note that to find this you need to consider 
the tracks’ minutes of each CD and compute the CD total minutes)*/
SELECT a.num, a.Type, SUM(b.minute) AS 'Total minutes'
FROM CD a 
JOIN CDTracks b
on a.num = b.num
WHERE a.type LIKE 'CLASSICAL%'
GROUP BY a.num HAVING SUM(b.minute) < 40; 


/*NO. 8: Which singer(s) is/are in the most number of CDs (note: not CD tracks, but CDs!). Show their 
id and names. */
SELECT a.singer_id, b.singer_f_nm, b.singer_l_nm
FROM CDSingers a
JOIN Singer b
ON a.singer_id = b.id
GROUP BY a.singer_id, b.singer_f_nm, b.singer_l_nm
ORDER BY COUNT(a.num) DESC
LIMIT 1; 


/*NO. 9 Which band has only one CD?*/ 
SELECT band_name
FROM CD
GROUP BY band_name
HAVING COUNT(*) = 1; 


/*NO. 10*/
SELECT a.producer, COUNT(a.type) as 'Producer Music Type Count'
FROM CD a
JOIN MusicType b
ON a.type = b.type
GROUP BY a.producer
ORDER BY COUNT(a.type); 


/*NO. 11*/ 
UPDATE CD 
SET price = price + (price * 0.05)
WHERE price BETWEEN 9 AND 12.99; 


/*NO. 12*/ 
CREATE VIEW CD_VIEW AS (SELECT producer, title, type, Production_date
FROM CD
WHERE type LIKE '%Classical%' OR type LIKE '%JAZZ%' OR TYPE LIKE '%Soft Rock%'); 

SHOW CREATE VIEW CD_VIEW;

























