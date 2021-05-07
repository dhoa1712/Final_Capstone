use world_vaccinations;
drop table country_vaccinations;

CREATE TABLE IF NOT EXISTS `country_vaccinations` (
  `country` VARCHAR(200) NOT NULL,
  `iso_code` VARCHAR(10) NOT NULL,
  `date` DATE NOT NULL,
  `total_vaccinations` INT NULL,
  `people_vaccinated` INT NULL,
  `people_fully_vaccinated` INT NULL,
  `daily_vaccinations_raw` INT NULL,
  `daily_vaccinations` INT NULL,
  `total_vaccinations_per_hundred` INT NULL,
  `people_vaccinated_per_hundred` INT NULL,
  `people_fully_vaccinated_per_hundred` INT NULL,
  `daily_vaccinations_per_million` INT NULL,
  `vaccines` VARCHAR(300) NULL,
  `source_name` VARCHAR(300) NULL,
  `source_website` VARCHAR(500) NULL,
  PRIMARY KEY (`iso_code`, `date`));

show tables;
select * from country_vaccinations;
select distinct country, iso_code from country_vaccinations;

select distinct country from country_vaccinations;

select c.country, t.iso_code, d.date, 
	t.total_vaccinations, 
    t.people_vaccinated, 
    t.people_fully_vaccinated, 
    t.daily_vaccinations_raw, 
    t.daily_vaccinations, 
    t. total_vaccinations_per_hundred, 
	t.people_vaccinated_per_hundred,
    t.people_fully_vaccinated_per_hundred,
    t.daily_vaccinations_per_million,
    t.vaccines,
    t.source_name,
    t.source_website
from (select distinct country, iso_code from country_vaccinations t) c cross join
     (select distinct date from country_vaccinations t) d left join
     country_vaccinations t
     on t.country = c.country and t.iso_code = c.iso_code and t.date = d.date
order by c.country, d.date;



