-- SQL and commands

-- Initialize the db using the provided init.sql file
psql -f init.sql

-- Log into psql
-- Connect to created db
\c mainframe_override

-- See forum_posts schema
\d forum_posts

-- Get everything from forum_posts in April 2048
SELECT * FROM forum_posts WHERE date BETWEEN '2048-04-01' AND '2048-04-30';

-- Filtering same function by whether title or content text contains 'emptystack' case insensitive
SELECT * FROM forum_posts WHERE (date BETWEEN '2048-04-01' AND '2048-04-30') AND (title ILIKE '%emptystack%' OR content ILIKE '%emptystack%');
-- 'smart-money-44' is the author mentioned in the hint after filtering, the other result just has 'EmptyStack' added to the end of the content

-- Find first and last name from accounts matching the username
SELECT * FROM forum_accounts WHERE username = 'smart-money-44';
-- Brad Steele

-- Find matching last names
SELECT * FROM forum_accounts WHERE last_name = 'Steele';
-- 'sharp-engine-57' = Andrew
-- 'stinky-tofu-98' = Kevin

-- Filter posts by usernames
SELECT content FROM forum_posts WHERE (author ILIKE 'stinky-tofu-98') OR (author ILIKE 'sharp-engine-57');
-- Was he lying about his dad being an active user on the forums because nothing comes back
-- Or maybe hes just a lurker

-- Filter employees with same last name
SELECT * FROM emptystack_accounts WHERE last_name = 'Steele';
-- triple-cart-38 | password456 | Andrew     | Steele
-- lance-main-11  | password789 | Lance      | Steele
-- It should be Andrew because hes the only one with a forum account with the same name

-- $ node mainframe
-- Username: triple-cart-38
-- Password: password456
-- Welcome, triple-cart-38!
-- Loading messages and projects...
-- Your data has been loaded to emptystack.sql. Have a nice day!

psql -f emptystack.sql

-- Filter messages sent to and from user
SELECT * FROM emptystack_messages WHERE ("to" = 'triple-cart-38') OR ("from" = 'triple-cart-38');
-- Have to use double quotes because 'to' and 'from' are reserved words
-- This is not filtered nearly enough, too much to comb through

-- His sons forum post content mentions some type of taxi, check body and subject
SELECT * FROM emptystack_messages WHERE (body ILIKE '%taxi%') OR (subject ILIKE '%taxi%');
--  id   |     from     |       to       |   subject    |                            body
-- LidWj | your-boss-99 | triple-cart-38 | Project TAXI | Deploy Project TAXI by end of week. We need this out ASAP.

SELECT * FROM emptystack_messages WHERE ("to" = 'your-boss-99') OR ("from" = 'your-boss-99');
-- Same message as above

SELECT * FROM emptystack_projects;
-- I dont seem to have a code that would match anything like that

SELECT * FROM emptystack_messages WHERE (body ILIKE '%project%') OR (subject ILIKE '%project%');
-- No new results

-- Try TAXI as the code
SELECT * FROM emptystack_projects WHERE code = 'TAXI';
-- DczE0v2b | TAXI

-- Get admin info
SELECT * FROM emptystack_accounts WHERE username = 'your-boss-99';
--   username   |    password    | first_name | last_name
-- your-boss-99 | notagaincarter | Skylar     | Singer


-- $ node mainframe -stop
-- WARNING: admin access required. Unauthorized access will be logged.
-- Username: your-boss-99
-- Password: notagaincarter
-- Welcome, your-boss-99.
-- Project ID: DczE0v2b
-- Initiating project shutdown sequence...
-- 5...
-- 4...
-- 3...
-- 2...
-- 1...
-- Project shutdown complete.