CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id SERIAL,
  country_name varchar(255),
  region_id int,
  population int
);

INSERT into countries VALUES (100, 'Palau', 123, 987654321);

SELECT *from countries;

ALTER TABLE countries ADD CONSTRAINT use PRIMARY KEY(country_id);

INSERT into countries VALUES (102, 'Monaco');

update countries set region_id=null ;

insert into countries (country_id, country_name, region_id, population)
values (107, 'Kazakhstan', 077, 17000000),
       (56, 'Russia', 308, 2600),
       (79, 'US', 911, 3710);

alter table countries
    alter column country_name set default 'Kazakhstan';

insert into countries values (99, default , 013, 1000000);

insert into countries values (default , default , default , default );

create table countries_new(
  like countries
);

SELECT *from countries_new;

insert into countries_new
select * from countries;

update countries_new set region_id = 1
where region_id is null ;

update countries_new set population = population * 1.1
    returning country_name, population as "New Population";

delete from countries
where population < 100000;

SELECT *from countries;

delete from countries_new
as cn using countries as co
where cn.country_id=co.country_id
returning *;

delete from countries
returning *;