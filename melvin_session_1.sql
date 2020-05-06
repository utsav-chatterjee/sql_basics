-- What is data?
--
-- A collection of facts, such as numbers, words, measurements, observations or just descriptions of things.
-- The world is full of data. Every app that you have on your phone or every website you visit, creates or consumes data in some form or another. For example, FB stores data about who you are, what you do, who you are friends with, etc. Bank of America stores data about who their customers are, how much money they have in which accounts, etc.
-- In the context of our discussion, how do these companies and apps store data?
-- They use a database.
--
-- What is a database?
--
-- It is a program that helps store data and provides functionality for adding, modifying and querying that data in a fast and easy way.
-- There are several types of databases out there, but the most popular type is called a Relational Database, which is what we are intererested in.
-- It helps us to store each kind of data in a table, which is similar to storing data in a spreadsheet.
-- Every row represents an item and every column referes to some property about that item.
-- For example, to store data about Facebook users, we could have a users table with a row for each user, and columns for properties like Name, Birthday, Nickname, and Location.
-- Relational databases make it particularly easy to form relationships between tables. For example, if we have a table containing names of fruits and another name that contains names of colors, we could remember which fruit has which color by just mapping the colors to fruits with an identifier, instead of having to repeat everything about the fruit and color in another table.
-- What is SQL?
--
-- Most databases come with a Query language to interact with the database. SQL is a language designed entirely for accessing databases and is the most popular of them.

-- creating a new database
CREATE DATABASE lessons;

-- Now that we have a database, let's create a table and store some data in it
-- Lets start with a grocery list.
-- Bananas (4) Peanut Butter (1) Dark Chocolate Bars (2)

-- If we only have 2 columns - name and quantity, we will be missing something that we need in databases. That is, a unique identifier for each row. We always need unique IDs for each row in a database because we need a way to identify rows later when we are updating or deleting them. Specifying that the id column is the primary key signals to the database that it shoudl treat this as the row identifier and that each row must have a unique value for this column.
-- creating a new table in the database
CREATE TABLE lessons.groceries
	(
		id INTEGER PRIMARY KEY,
		name TEXT,
		quantity INTEGER
	);

-- inserting some data into the table
INSERT INTO lessons.groceries VALUES(1, "Bananas", 4);
INSERT INTO lessons.groceries VALUES(2, "Peanut Butter", 1);
INSERT INTO lessons.groceries VALUES(3, "Dark Chocolate Bars", 2);

-- viewing the data
SELECT * FROM lessons.groceries;

-- Let's try this again - Create a table to store a list of books.
-- The columns should be id, name and rating
create table lessons.books
	(
		id integer primary key,
		name text,
		rating integer
	);

INSERT INTO lessons.books VALUES(1, "Spiderman", 3);

-- You can insert multiple values into the table like this
insert into lessons.books
	VALUES
	(2, "The Avengers", 4),
	(3, "Batman", 2),
	(4, "The Hulk", 5),
	(5, "Archies", 2);

-- Lets see what the table looks like
select *
from lessons.books;

-- We can also select specific columns from the tables
select
	name,
	rating
from
	lessons.books;

-- We can count the number of rows in the table
SELECT
	count(*)
FROM
	lessons.books;

-- We can order the records based on a certain column
SELECT
	*
FROM
	lessons.books
order by
	id;

-- Now, let's go back to the groceries example. Let's take a quick look at the data we currently have in there
SELECT
	*
FROM
	lessons.groceries;

-- Let's add another column into this table
alter table lessons.groceries
add column aisle integer
after quantity;

-- now lets try to add some values to the null aisle rows
update lessons.groceries
	set
		aisle = 7
	where
		id = 1;

update lessons.groceries
	set
		aisle = 2
	where
		id = 2;

update lessons.groceries
	set
		aisle = 2
	where
		id = 3;

-- Inserting some more data into the table Now
insert into lessons.groceries
	VALUES
		(4, "Ice cream", 1, 12),
		(5, "Cherries", 6, 2),
		(6, "Chocolate syrup", 0, 4);

-- To be more efficient at the grocery store, it would make a lot more sense if we ordered the aisles
SELECT *
FROM lessons.groceries
order by aisle;

-- Now, let's say you and I are shopping in the store and to speed things up, you're going to go pick up all the items that are in isles 1-6 and I will pick up items in isles 7-12. This is where we use the WHERE clause.
SELECT *
FROM lessons.groceries
WHERE
	aisle <= 6
order by aisle;

-- Let's practice this with some different data
CREATE TABLE lessons.movies
(
	id INTEGER PRIMARY KEY,
	name TEXT,
	release_year INTEGER
);

INSERT INTO lessons.movies
VALUES
 	(1, "Avatar", 2009),
	(2, "Titanic", 1997),
	(3, "Star Wars: Episode IV - A New Hope", 1977),
	(4, "Shrek 2", 2004),
	(5, "The Lion King", 1994),
	(6, "Disney's Up", 2009);

SELECT *
FROM lessons.movies;

-- How do you select the movies that were released in the year 2000 and after?
SELECT *
FROM lessons.movies
WHERE
	release_year >= 2000
order by
	release_year;


-- Now, back to our groceries table
SELECT *
FROM lessons.groceries;

-- Now, there are only 6 items in our groceries list, but we are buying different quantities of each, so what if you wanted to find the total number of items that you're buying?

select sum(quantity) as total_quantity
from lessons.groceries;

-- If you want to see how many total quantity of items you are buying from each aisle, you can use the group by clause.
select
	aisle,
	sum(quantity) as total_quantity
from lessons.groceries
group by aisle;
