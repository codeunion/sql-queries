# A Toy Database

Here is a toy database which models an online music store.  In this database, we have falling into three categories: information about the company, information about customers and their orders, and information about the products being sold.

You'll be editing the `queries.sql` file, which consists of a series of
"plain English" sentences.  Your job is to translate those sentences into a
single SQL `SELECT` query.  Don't worry if you can't do it — take your best shot!

## Contents

1. [The Plain English Queries](#the-plain-english-queries)
2. [Configuring SQLite3](#configuring-sqlite3)
3. [The Database Tables](#the-database-tables)
  1. [Information About The Products](#information-about-the-products)
  2. [Information About Customers and Their Orders](#information-about-customers-and-their-orders)
  3. [Information About The Company](#information-about-the-company)
4. [One Key Idea](#one-key-idea)

## The Plain English Queries

See queries.sql.  Open the database by running this in your terminal:

```bash
sqlite3 music-store.db
```

Once inside, type the following at the SQLite3 prompt

```text
sqlite> .schema
```

to list all the tables in the database.  To see the schema for a specific table,
you can type, e.g., the `invoices` table

```text
sqlite> .schema invoices
```

Don't be afraid to explore the data in the tables to get a better feeling
for how it's formatted.  It's impossible to damage your database as long
as you're only running `SELECT` queries.  For example, what does the data
in the invoices table look like?  Well, let's look at a 5 rows

```sql
SELECT * FROM invoices LIMIT 5;
```

That's what we mean by "explore."

## Configuring SQLite3

The default settings for SQLite3 can make it hard to read the output of `SELECT`
queries.  To change these settings, run the following three commands once you're inside
the SQLite3 shell.  You should just be able to copy and paste these three lines.

```text
.header on
.mode column
.width 20
```

It should look roughly like this: http://cl.ly/image/24431S2W0I3f

If you want to make these settings permanent, copy and paste the following
command into your **terminal** (not the sqlite shell). **Note**: this will not
work on Windows.

```bash
cat <<EOF > ~/.sqliterc
.header on
.mode column
.width 20
EOF
```

You should copy and paste all 5 lines and it should look roughly like this: http://cl.ly/image/3w1Y0l1a0W38

Don't worry about what all the parts of this command are.  The short of it is
that this is adding lines to a file named `.sqliterc`, which SQLite3 uses to
determine its default settings.

## The Database Tables

Remember: relational databases are organized into tables.  Each table has a "schema", which dictates the fields (aka columns) that the data in the table can or must contain.  The data itself is stored as records (aka rows).

Here are the tables, organized by high-level purpose.

### Information About The Products

1. `albums` are the albums our store is selling
2. `artists` are all the artists
3. `tracks` are all the tracks, containing a column that tells us which album the track belongs to.
4. `media_types` tell us what format a track is in, e.g., MP3, Apple Audio, etc.
5. `genres` are a list of genres.
6. `playlists` are, well, playlists.  A play list has many tracks and a single track can belong to many playlists.
7. `playlist_tracks` tells us which tracks belong to which playlists

### Information About Customers and Their Orders

1. `customers` are our customer records and they may or may not have an assigned "customer support representative"
2. `invoices` are a list of specific customer orders
3. `invoice_lines` are the line-items on specific invoices

### Information About The Company

1. `employees` contains information about our company's employees.  This is mostly used to assign support representatives to customers.

## One Key Idea

One of the key ideas in how relational databases like SQLite3 and MySQL organize data is that we try to minimize redundancy by using references to other data rather than duplicating that data between different tables.

For example, every track belongs to one (and only one) album.  An album has its own associated information, like album title, publication date, and so on.  Each track also has its own associated information, like track title, track position, and duration.  We want to be able to ask questions like "What is the title of the album on which track X appears?"

If you imagine a spreadsheet with a bunch of track listings, one way to achieve this would be to have an "Album Title" column and to answer this question we would just look at the value in the "Album Title" column for track X.  Every track on the same album would have the same value in the "Album Title" column, although heaven help us if there are two separate albums with the same title!

This is not how we store information in a relational database.  Rather than storing album-related information in the same table as track-related information, we store album-related information in an "albums" table and track-related information in a "tracks" table.  We assign each track and album a unique ID.  In the "tracks" table we would when have an `album_id` column containing the unique album ID as a *reference* or *pointer* to the relevant row in the "albums" table.

Excel can do this, but it is too cumbersome for the most common tasks.  In a relational database like SQLite3 or MySQL, however, it is much easier to deal with.  In fact, SQL (the language) is counting on you storing your data this way.
