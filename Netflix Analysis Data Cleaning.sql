create database if not exists Commerce;

use Commerce;

Create table  netflix(
show_id varchar(20),
type varchar(50),	
title varchar(500),	
director varchar(500),	
cast	text,
country	varchar(500),
date_added	varchar(500),
release_year int,	
rating	varchar(50),
duration varchar(50),	
listed_in varchar(500),	
description text
);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles.csv'
into table netflix
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows
(show_id, type,	title,	director,	cast,	country,	date_added,	release_year,	
rating,	duration,	listed_in,	description);

select count(*) as total_count
from netflix;

select 
 distinct type from netflix;


select *
from netflix;



-------- Data Cleaning Section ------------------

 --------- 1. Remove Duplicate
 
 select *
from netflix;


create table netflix_2
like netflix;


select *
from netflix_2;

insert netflix_2
select *
from netflix;

select *
from netflix_2;

select show_id, count(*) as total_duplicate
from netflix
group by show_id
having count(*) >1;


alter table netflix
add primary key (show_id);

select count(*)-count(distinct show_id) as total_duplicate
from netflix_2;

-------- RESULT: Total Duplicates is Zero therefore no need for remove any duplicates

 --------- 2. Null values



--------- Explain why you chose a particular method.


 ------  Identify columns with missing values.

select count(*) as missing_values
from netflix_2
where show_id is null or show_id= '';

select count(*) as missing_values
from netflix_2
where type is null or type = '';

select count(*) as missing_values
from netflix_2
where title is null or title = '';

select count(*) as missing_values
from netflix_2
where director is null or  director = '';

select count(*) as missing_values
from netflix_2
where cast is null or cast = '';

select count(*) as missing_values
from netflix_2
where country is null or country = '';

select  count(*) as missing_values
from netflix_2
where date_added is null or date_added='';

select count(*) as missing_values
from netflix_2
where release_year is null or release_year='';

select count(*) as missing_values
from netflix_2
where rating is null or rating = '';

select count(*) as missing_values
from netflix_2
where duration is null or duration='';

select count(*) as missing_values
from netflix_2
where listed_in is null or listed_in = '';

select count(*) as missing_values
from netflix_2
where description is null or description = '' ;

-------- Show the number of missing values per column.

SELECT 
    'show_id' AS column_name,
    SUM(CASE WHEN show_id IS NULL 
    OR show_id = '' THEN 1 ELSE 0 END) 
    AS missing_count
FROM netflix_2
UNION ALL
SELECT 'type',
    SUM(CASE WHEN type IS NULL 
    OR type = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'title',
    SUM(CASE WHEN title IS NULL 
    OR title = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'director',
    SUM(CASE WHEN director IS NULL 
    OR director = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'cast',
    SUM(CASE WHEN country IS NULL 
    OR country = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'country',
    SUM(CASE WHEN date_added IS NULL 
    OR date_added = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'date_added',
    SUM(CASE WHEN rating IS NULL 
    OR rating = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'release_year',
    SUM(CASE WHEN duration IS NULL 
    OR duration = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION
SELECT 'date_added',
    SUM(CASE WHEN rating IS NULL 
    OR rating = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'rating',
    SUM(CASE WHEN rating IS NULL 
    OR rating = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'duration',
    SUM(CASE WHEN rating IS NULL 
    OR rating = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'listed_in',
    SUM(CASE WHEN rating IS NULL 
    OR rating = '' THEN 1 ELSE 0 END)
FROM netflix_2
UNION ALL
SELECT 'description',
    SUM(CASE WHEN rating IS NULL 
    OR rating = '' THEN 1 ELSE 0 END)
FROM netflix_2;

--------- Handle missing values appropriately.


update netflix_2
set type  = 'Unknown'
where type is null or  type= '';

update netflix_2
set title  = 'Unknown'
where title is null or title = '';

update netflix_2
set director  = 'Unknown'
where director is null or  director= '';

update netflix_2
set country  = 'Unknown'
where country is null or country = '';

update netflix_2
set cast ='Unknown'
where cast is null or cast='';

update netflix_2
set date_added= 0
where  date_added is null or date_added = '';

update netflix_2
set release_year  = 'Unknown'
where release_year is null or release_year = '';


update netflix_2
set rating  = 'Unknown'
where rating is null or rating = '';

update netflix_2
set duration  = 'Unknown'
where duration is null or duration = '';

update netflix_2
set description  = 'Unknown'
where description is null or description = '';

select count(*)
from netflix
where type   ='unknown';


SELECT * FROM netflix_2; 



