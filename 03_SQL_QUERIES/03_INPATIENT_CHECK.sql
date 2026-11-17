/*

GOAL: CHECK THE INPATIENT FILE

DETERMINE IF ROW COUNTS AND UNIQUE CLAIMS MATCH 
DETERMINE EARLIEST FROM DATE
DETERMINE LATEST FROM DATE
DETERMINE IF THERE ARE ANY NEGATIVE CLAIM AMOUNT

*/

SELECT
	COUNT(*) AS row_count,
	COUNT(DISTINCT i.CLM_ID) AS unique_claim_count,
	MIN(i.CLM_FROM_DT) AS earliest_from_date,
	MAX(CAST(i.CLM_FROM_DT AS INTEGER)) AS latest_from_date,
	SUM(CASE WHEN i.CLM_PMT_AMT < 0 THEN 1 ELSE 0 END) AS neg_claim_amounts
FROM
	inpatient i;

/*
 
RESULTS:
66,414 TOTAL ROWS
66,348 UNIQUE CLAIMS >> SOME CLAIMS ARE APPEARING MORE THAN ONCE
EARLIEST CLAIM IS FROM 11/29/2007
LATEST CLAIM IS FROM 12/31/2010
53 NEGATIVE CLAIM AMOUNTS

row_count|unique_claim_count|earliest_from_date|latest_from_date|neg_claim_amounts|
---------+------------------+------------------+----------------+-----------------+
    66414|             66348|          20071129|        20101231|               53|

*/