CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.crmdata_new AS (
    SELECT * FROM read_csv_auto('data/crm_new.csv')
);

CREATE TABLE IF NOT EXISTS staging.crmdata_old AS (
    SELECT * FROM read_csv_auto('data/crm_old.csv')
);





/* Task 2 */
-- find invalid emails
-- use LIKE operator with wildcards for the old data

SELECT * FROM staging.crmdata_old
WHERE NOT email LIKE '%@%.%';

-- use REGEXP functions for the new data
-- because the above query cannot 

SELECT * FROM staging.crmdata_new
WHERE regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+');