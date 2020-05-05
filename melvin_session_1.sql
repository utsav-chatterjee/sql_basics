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
