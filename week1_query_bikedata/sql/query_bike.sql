/* ==============
   Query the data
   ============== */

-- overview of data
DESC; 

DESC staging.joined_table; 

-- select all or some columns
SELECT * FROM staging.joined_table; 

SELECT 
   order_date,
   customer_first_name,
   customer_last_name,
   product_name
FROM staging.joined_table; 

-- filter rows with WHERE clause
SELECT 
   order_date,
   customer_first_name,
   customer_last_name,
   product_name
FROM staging.joined_table
WHERE customer_first_name = 'Marvin'; 

-- create a new table for order status description
CREATE TABLE IF NOT EXISTS staging.status (
   order_status INTEGER,
   order_status_description VARCHAR
); 

SELECT * FROM staging.status; 

INSERT INTO 
   staging.status
VALUES
   (1, 'Pending'),
   (2, 'Processing'),
   (3, 'Rejected'),
   (4, 'Completed');

-- join the two tables
SELECT 
  j.order_id,
  j.order_status,
  s.order_status_description
FROM staging.joined_table j
JOIN staging.status s ON j.order_status = s.order_status; 

-- sort the rows by order_status
-- ORDER BY...ASC DESC
SELECT 
  j.order_id,
  j.order_status,
  s.order_status_description
FROM staging.joined_table j
JOIN staging.status s ON j.order_status = s.order_status
-- ORDER BY j.order_status DESC;
ORDER BY j.order_status ASC; 

/* ===============
    customers
    =============== */


-- DISTINCT
SELECT DISTINCT order_id
FROM staging.joined_table
ORDER BY order_id DESC;

-- find unique values of customer_id
SELECT DISTINCT customer_id
FROM staging.joined_table
ORDER BY customer_id ASC;

-- find unique values of customer full names
SELECT DISTINCT customer_first_name, customer_last_name
FROM staging.joined_table
ORDER BY customer_last_name, customer_first_name;

-- it is 'justina jenkis' that is the issue
-- this can be found out by one window function
-- below also shows WHERE clause with two conditions
SELECT
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_city
FROM staging.joined_table
WHERE customer_first_name = 'Justina' AND customer_last_name = 'Jenkis'

/* ===============
   Introduce
   aggregation
   =============== */
   -- aggregate over rows 
   -- there are different ways of aggregation (max, min, avg, sum, count)DESC;


   SELECT

   FROM staging.joined_table;

-- try out 
