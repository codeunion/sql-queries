-- Joins (via the JOIN clause) are how we query data contained in multiple tables.
-- There are two main types of relationships:
--   1. One-to-many
--   2. Many-to-many

-- For example, a customer has many invoices, but each invoice belongs to one
-- and only one customer.  This is a one-to-many relationship.

-- Think of some one-to-many relationships in every day life, e.g.,
--
--   1. A car can get many parking tickets, but a parking ticket belongs to
--      one and only one car.
--   2. Every state in the US has many cities, but every city in the US is in
--      one and only one state.
--   3. Customers can have many orders, but an order belongs to a single customer
--   4. Customers can have multiple credit cards, but every credit card belong
--      to a single customer.
--   5. Think of some of your own.

-- An example of a many-to-many relationship might be events and people.
-- I can attend many events and each event has many attendees.
-- In our toy database, we're only dealing with one-to-many relationships.

-- The 5 customers who most recently purchased something
SELECT customers.id, customers.first_name,
       customers.last_name, customers.email,
       invoices.invoice_date, invoices.total
FROM customers
JOIN invoices
  ON (invoices.customer_id = customers.id)
ORDER BY invoices.invoice_date DESC
LIMIT 5;

-- The top 10 customers by total number of orders
SELECT customers.id, customers.first_name,
       customers.last_name, customers.email,
       COUNT(*) AS order_count
FROM customers
JOIN invoices
  ON (invoices.customer_id = customers.id)
GROUP BY customers.id
ORDER BY order_count DESC
LIMIT 10;

-- The top 10 customers by gross sales
SELECT customers.id, customers.first_name,
       customers.last_name, customers.email,
       SUM(total) AS gross_sales
FROM customers
JOIN invoices
  ON (invoices.customer_id = customers.id)
GROUP BY customers.id
ORDER BY gross_sales DESC
LIMIT 10;

-- The top 5 genres by number of tracks (fill in the blanks)
SELECT genres.id, genres.name, COUNT(*) AS track_count
FROM genres
JOIN tracks
  ON (tracks.genre_id = genres.id)
GROUP BY genres.id
ORDER BY track_count DESC
LIMIT 5;

-- The top 5 genres by total track length (in milliseconds)

-- The top 5 genres by average track length (in milliseconds)

-- The top 5 albums by total track length
-- Hint: you'll need to JOIN the albums table and the tracks table
-- Hint: the tracks table has an album_id field

-- The top 5 albums by average track length

-- The top 5 albums by total album price
-- Hint: the "tracks" table has a unit_price field, so the "price" of an album
--       is the sum of its tracks' unit_price fields.

-- The 10 albums with the longest play-time

-- The 10 highest-selling tracks of all time
-- Hint: you'll need to join the tracks table and the invoice_lines table
