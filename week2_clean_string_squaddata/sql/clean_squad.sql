/* =======
   Task 2
   ======= */
SELECT *
FROM staging.squad
WHERE title NOT IN context;
/* =======
   Task 3
   ======= */
-- use LIKE operator with wildcard %
SELECT
  *
FROM staging.squad
WHERE context LIKE CONCAT(title, '%'); 
-- check the results for Southern_California
-- the results are not ok due to the wildcard _

-- if ypu use regular expression functions, underscore will be a literal character
SELECT *
FROM staging.squad
WHERE regexp_matches(context, CONCAT('^', title));

/* =======
   Task 4
   ======= */

-- show a new column which is the first answer from the AI model
-- without pattern matching
SELECT
 answers[18:], -- slicing
 answers[18], -- indexing 
 CASE 
  WHEN answers[18] = ',' THEN NULL
  ELSE answers[18:]
END AS striped_answers,
striped_answers[:6],
INSTR(striped_answers, '''') AS first_quotation_index, -- a single quoation needs to be typed as '',
striped_answers[:first_quotation_index-1] AS first_answers,
 answers
FROM staging.squad;

/* =======
   Task 5
   ======= */

--
