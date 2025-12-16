USE world;

SELECT * FROM city ;
SELECT * FROM country ;
SELECT * FROM countrylanguage ;

-- 1 : Count how many cities are there in each country?
Select countrycode, count(name) As total_cities
From city 
group by countrycode;

-- 2 : Display all continents having more than 30 countries.
SELECT continent, count(code) As total_country 
from country 
group by continent
Having total_country > 30;

-- 3: List regions whose total population exceeds 200 million.
SELECT Region, sum(population) as total_pop
from country 
group by Region 
Having total_pop > 200000000 ;

-- 4 : Find the top 5 continents by average GNP per country.
SELECT Continent, code, AVG(GNP)
From Country
Group by Continent, code
order by AVG(GNP) Desc
LIMIT 5;

-- 5 : Find the total number of official languages spoken in each continent.
Select  co.Continent, count(Language), cl.Isofficial  
from countrylanguage cl
join country co on cl.countrycode = co.code
group by cl.countrycode, cl.Isofficial, co.continent
Having Isofficial = 'T';

-- 6 : Find the maximum and minimum GNP for each continent.
SELECT continent, max(GNP), min(GNP)
FROM Country 
GROUP BY continent;
 
-- 7 : Find the country with the highest average city population. 
SELECT CountryCode, AVG(Population)
FROM City
GROUP BY countrycode
ORDER BY AVG(Population) DESC
LIMIT 1;

-- 8 : List continents where the average city population is greater than 200,000.
SELECT co.continent, AVG(ci.Population)
FROM City ci
inner join country co on ci.CountryCode = co.code 
GROUP BY co.continent
HAVING AVG(ci.Population) > 200000
ORDER BY AVG(ci.Population) ASC;

-- 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending. 
SELECT continent, SUM(Population), AVG(LifeExpectancy)
FROM Country 
GROUP BY Continent 
ORDER BY AVG(LifeExpectancy) DESC;

-- 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.
SELECT continent, SUM(Population), AVG(LifeExpectancy)
FROM Country 
GROUP BY Continent
HAVING  SUM(Population) > 200000000
ORDER BY AVG(LifeExpectancy) DESC
LIMIT 3;

