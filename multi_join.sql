-- Outline
--
-- All of these JOINs requires more than two tables.
-- Remember: then using the JOIN keyword it doesn't matter what order we join
-- the tables in.  That is,
--
--   SELECT * FROM TableA JOIN TableB ON (TableA.id = TableB.table_a_id)
--
-- is the same as
--
--   SELECT * FROM TableB JOIN TableA ON (TableA.id = TableB.table_a_id)
--
-- Also remember: the syntax TableA.first_name means the "first_name" field
-- from the table named TableA.  Field names have to be unique in a given table.
-- That is, you can't have two fields / columns named "first_name" in the same
-- table.
--
-- However, two *different* tables can both have a "first_name" field. For
-- example, you might have a "customers" table and an "employees" table, both
-- of which have "first_name", "last_name", and "email" fields.  If you have
-- a query that involves *both* customers and employees, you'll need to refer
-- to fields using their table name, i.e., customers.first_name,
-- employees.first_name, customers.email, and so on.

-- Remember, the "skeleton" for a SELECT query with JOINs looks like
--
--   SELECT <field names>
--   FROM <table1>
--   JOIN <table2>
--     ON (<join condition>)
--   JOIN <table3>
--     ON (<join condition>)
--   WHERE <filtering clauses>
--   GROUP BY / ORDER BY / LIMIT / etc.
--
-- This is the general order, but a SELECT query *always* needs a FROM clause.

-- Exercises
--

-- What are the five highest grossing hip hop tracks?

-- What are the 3 least frequently-purchased tv shows?

-- What are the 5 highest-grossing genres?

-- Who are the 5 artists with the longest average track length?

-- Write a query that sorts a specific album's tracks by sales volume (you'll have to pick an arbitrary album title)
--   e.g., "Give me the the tracks from Alanis Morissette's Jagged Little Pilled sorted by sales volume"

-- Write a query that sorts a specific album's tracks by gross sales (you'll have to pick an arbitrary album title)

-- How would you handle the case where two different artists have albums with the same name?
--   e.g., sometimes both Peter Gabriel's first album and Led Zeppelin's first album are referred to as "One" or "I"

-- We're runnin' low on queries!  Come up with 3-5 of your own and write them.
