DROP TABLE movies;
DROP TABLE people;

CREATE TABLE movies (
	id SERIAL8 PRIMARY KEY,
	title VARCHAR(255),
	year INT2,
	show_time VARCHAR(255)
);

CREATE TABLE people (
	id SERIAL8 PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO people (name) VALUES ('Miguel Almeida');
INSERT INTO people (name) VALUES ('Callum Bentley');
INSERT INTO people (name) VALUES ('Zackary Coleman');
INSERT INTO people (name) VALUES ('Daniel Colyer');
INSERT INTO people (name) VALUES ('Adm Conway');
INSERT INTO people (name) VALUES ('Peter Crowther');
INSERT INTO people (name) VALUES ('Marta Dabrowka');
INSERT INTO people (name) VALUES ('Graeme Doran');
INSERT INTO people (name) VALUES ('John Duncan');
INSERT INTO people (name) VALUES ('Kayla Fowler');
INSERT INTO people (name) VALUES ('Diana Prince');
INSERT INTO people (name) VALUES ('Diana Prince');
INSERT INTO people (name) VALUES ('Chris Marshall');
INSERT INTO people (name) VALUES ('Aline Mokfa');
INSERT INTO people (name) VALUES ('Joao Nequinha');
INSERT INTO people (name) VALUES ('Yoni Satat');
INSERT INTO people (name) VALUES ('Kynan Song');
INSERT INTO people (name) VALUES ('Craig Morton');
INSERT INTO people (name) VALUES ('Hamish Stewart');
INSERT INTO people (name) VALUES ('Huascar Suave');
INSERT INTO people (name) VALUES ('Rob Williams');
INSERT INTO people (name) VALUES ('Laurence Woodward');
INSERT INTO people (name) VALUES ('Andre Zyczkowski');



INSERT INTO movies (title, year, show_time) VALUES ('Iron Man', 2008, '15:15');
INSERT INTO movies (title, year, show_time) VALUES ('The Incredible Hulk', 2008, '22:05');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 2', 2010, '18:05');
INSERT INTO movies (title, year, show_time) VALUES ('Thor', 2011, '13:00');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The First Avenger', 2011, '22:15');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers Assemble', 2012, '23:25');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 3', 2013, '12:05');
INSERT INTO movies (title, year, show_time) VALUES ('Thor: The Dark World', 2013, '13:25');
INSERT INTO movies (title, year, show_time) VALUES ('Batman Begins', 2005, '23:55');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The Winter Soldier', 2014, '19:40');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy', 2014, '18:55');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers: Age of Ultron', 2015, '21:10');
INSERT INTO movies (title, year, show_time) VALUES ('Ant-Man', 2015, '15:20');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: Civil War', 2016, '22:45');
INSERT INTO movies (title, year, show_time) VALUES ('Doctor Strange', 2016, '22:00');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy 2', 2017, '15:30');


SELECT name FROM people;
UPDATE people
SET name = 'Adam Conway'
WHERE name = 'Adm Conway';

UPDATE people
SET name = 'Huascar Montero'
WHERE name = 'Huascar Suave';

UPDATE people
SET name = 'Tony Stark'
WHERE id = 11;

UPDATE people
SET name = 'David Banner'
WHERE id = 12;

SELECT name FROM people WHERE name = 'Huascar Suave';

DELETE FROM movies WHERE title = 'Batman Begins';

INSERT INTO people (name) VALUES ('Darren');

DELETE FROM movies WHERE id = 9;

DELETE FROM people WHERE name = 'Craig Morton';

INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy 2', 2017, '12:00');

UPDATE movies
SET show_time = '21:30'
WHERE id = 11;

-- Deletes specific id's.
DELETE FROM people WHERE id in (11, 9, 7);

-- Deletes everything between 2 id values.
DELETE FROM people WHERE id BETWEEN 2 AND 8;

-- Deletes movies with id less or equal to 16 and greater or equal to 5.
DELETE FROM movies WHERE id <= 16 and id >= 5;

-- Deletes a column.
--ALTER TABLE table_name
--DROP COLUMN column_name;

SELECT * FROM movies ORDER BY id ASC;

SELECT * FROM people ORDER BY id ASC;



-- Extension

--DELETE FROM table
--where id between 163 and 265

-- delete from your_table
-- where id in (value1, value2, ...);
--
-- delete from your_table
-- where id in (select aColumn from ...);
-- (Notice that the subquery must return only one column)
--
-- If you need to delete based on a range of values, either you use BETWEEN or you use inequalities:
--
-- delete from your_table
-- where id between bottom_value and top_value;
-- or
--
-- delete from your_table
-- where id >= a_value and id <= another_value;

-- Using Another Table to Identify the Rows to Delete and the OUTPUT Clause
--
-- There are times when you might what to delete the rows in a table based on values from another table. An example of where you might want to do this is to remove rows from your inventory table based on some sales data. To demo this first I will need to generate another table that contains key values for the rows I want to delete. Here is the code to create and populate my other table:
--
-- CREATE TABLE RecordsToDelete (
-- DeleteDesc varchar(100));
-- GO
-- INSERT INTO RecordsToDelete VALUES
-- ('Thing Two'),
-- ('Sally');
-- At this point after running all my different DELETE statements against my DemoDelete table there are only three rows left in my table. By selecting all the rows in my DemoDelete table I see that these three rows are left:
--
-- ID DeleteDesc
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 2 Thing Two
-- 3 The Cat
-- 4 Sally
-- In order to use the RecordsToDelete table to delete specific records in my DemoDelete table I need to run the code below.
--
-- DELETE FROM DemoDelete
-- OUTPUT DELETED.*
-- FROM DemoDelete INNER JOIN RecordsToDelete
-- on DemoDelete.DeleteDesc = RecordsToDelete.DeleteDesc;
-- This code joins the table DemoDelete and RecordsToDelete based on the DeleteDesc column. When the DeleteDesc matches between the two tables the matched rows within the DemoDelete table are deleted.
--
-- My delete statement above also contains the OUTPUT clause. The OUTPUT clause is used to return the column values of the deleted rows that are identified in the OUTPUT clause. In the code above I specified "DELETED.*". The "*" means to return all the columns values from the DELETED rows. When I ran this code the following rows were returned:
--
-- ID DeleteDesc
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
-- 2 Thing Two
-- 4 Sally
-- These returned rows could be used by your application for some purpose, like creating an audit trail.
