/*Populate sales table using sales.csv file*/

BULK INSERT dbo.sales
FROM 'G:\QA\SQL session\sales.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
);

select * from customer;

select * from sales;


/*Select all products with brand “Cacti Plus”*/

select * from product
where brand='Cacti Plus';


/*Count of total products with product category=”Skin Care”*/

select count(*) 'Skin Care'from product
where category='Skin Care';


/*Count of total products with MRP more than 100*/

select count (*) 'MRP>100'from product
where mrp>100;


/*Count of total products with product category=”Skin Care” and MRP more than 100*/

select count (*) 'Skincare and MRP' from product
where category ='Skin Care' and mrp>100;


/*Brandwise product count*/

select product.brand, count (product.product_id)
from product group by brand;


/*Brandwise as well as Active/Inactive Status wise product count*/

select product.brand, count(*) as Total, sum(case when active='Y' then 1 else 0 end) as Active,
sum(case when active='N' then 1 else 0 end) as Inactive
from product group by brand;


/*Display all columns with Product category in Skin Care or Hair Care*/

select * from product
where category='Skin Care' or category='Hair Care';


/*Display all columns with Product category in Skin Care or Hair Care, and MRP more than 100*/

select * from product
where (category='Skin Care' or category='Hair Care') and mrp>100;


/*Display   all   columns   with   Product   category=”Skin   Care”   and
Brand=”Pondy”, and MRP more than 100*/

select * from product
where category='Skin Care' and brand='Pondy' and mrp>100;


/*Display   all   columns   with   Product   category   =”Skin   Care”   or
Brand=”Pondy”, and more than 100*/

select * from product
where (category='Skin Care' or brand='Pondy') and mrp>100;


/*Display all product names only with names starting from letter P*/

select product_name from product
where product_name like 'P%';


/*Display  all product  names only with names Having letters “Bar”  in Between*/

select product_name from product
where product_name like '%Bar%';


/*Sales of those products which have been sold in more than two quantity in a bill*/
select * from sales;

select * from sales
where qty>2;


/*Sales of those products which have been sold in more than two quantity throughout the bill*/

select product_id, sum(qty) Quantity from sales
group by product_id having sum(qty)>2;


/*Create a new table with columns username and birthday, and dump data from dates file. Convert it to .csv format if required.
Research on Date Function Queries from the slide*/

create table datess (
    name varchar(20),
	birthdate date
);

BULK INSERT dbo.datess
FROM 'G:\QA\SQL session\dates.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
);

select * from datess;

/*no of people sharing Birth date*/

select distinct *
from (
   select birthdate, count(*) over (partition by birthdate) as People
   from datess
) same
where same.People > 1;


/*no of people sharing Birth month*/

select count(*) as Total, datename(month, birthdate) as MonthName
from datess
 group by datename(month, birthdate) order by Monthname;


/*no of people sharing Weekday*/

select count(*) as Total, datename(weekday, datepart(weekday, birthdate)) as Weekday
from datess
group by datepart(weekday, birthdate);


/*Find the current age of all people*/

select *, datediff(year, birthdate, getdate()) age from datess;
