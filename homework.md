# SQL Homework

The Dominion Cinema are having a Marvel Movie Marathon! They have asked you to help maintain their database of movies with times and attendees.

## To access the database:

First, create a database called 'marvel'

```
# terminal
createdb marvel
```

Next, run the provided SQL script to populate your database:

```
# terminal
psql -d marvel -f marvel.sql
```

Use the supplied data as the source of data to answer the questions.  Copy the SQL command you have used to get the answer, and paste it below the question, along with the result they gave.

## Questions

1. Return ALL the data in the 'movies' table.

SELECT * FROM movies;

2. Return ONLY the name column from the 'people' table

SELECT name FROM people;


3. Oops! Someone at CodeClan spelled Adam's name wrong! Change it to reflect the proper spelling (change 'Adm Conway' to 'Adam Conway').

UPDATE people
SET name = 'Adam Conway'
WHERE name = 'Adm Conway';

4. Return ONLY your name from the 'people' table.

SELECT name FROM people WHERE "Huascar"

5. The cinema is showing 'Batman Begins', but Batman is DC, not Marvel! Delete the entry from the 'movies' table.

DELETE FROM movies WHERE title = 'Batman Begins';

6. Create a new entry in the 'people' table with the name of one of the instructors.

INSERT INTO people (name) VALUES ('Darren');

7. Craig Morton, has decided to hijack our movie evening, Remove him from the table of people.

DELETE FROM movies WHERE id = 9;

8. Somehow the list of people includes two people named 'Diana Prince'. Change these entries to the proper names ('Tony Stark' and 'David Banner')

DELETE FROM people WHERE name = 'Craig Morton';

9. The cinema has just heard that they will be holding an exclusive midnight showing of 'Guardians of the Galaxy 2'!! Create a new entry in the 'movies' table to reflect this.

INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy 2', 2017, '12:00');

10. The cinema would also like to make the Guardian movies a back to back feature. Update the 'Guardians of the Galaxy' show time from 18:55 to 21:30

UPDATE movies
SET show_time = '21:30'
WHERE id = 11;

## Extension

1. Research how to delete multiple entries from your table in a single command.

A statement is like a 'command' in a SQL file that manipulates date in a database.

-- Deletes specific id's.
DELETE FROM people WHERE id in (11, 9, 7);

-- Deletes everything between 2 id values.
DELETE FROM people WHERE id BETWEEN 2 AND 8;

-- Deletes movies with id less or equal to 16 and greater or equal to 5.
DELETE FROM movies WHERE id <= 16 and id >= 5;



'SELECT DISTINCT' will return each type in column without duplicates. f.e 'movie genres'.

'LIKE' will return data with similar characters or values. f.e 'LIKE 'a%' would return movies starting with A'
