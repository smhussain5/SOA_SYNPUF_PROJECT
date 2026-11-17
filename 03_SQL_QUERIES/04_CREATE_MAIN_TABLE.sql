/*

GOAL: CREATE TABLE COMBINING 2008 AND 2009 BENEFICIARY INFORMATION 

SELECT MEMBER ID, YEAR, MEMBER MONTHS, INPATIENT REIMBURSEMENT, OUTPATIENT REIMBURSEMENT, AND CARRIER REIMBURSEMENT FOR BOTH 2008 AND 2009 YEARS
ONLY KEEP ROWS WHERE THERE IS NO HMO COVERAGE, AT LEAST ONE MONTH OF PART A COVERAGE, AND EQUAL AMOUNTS OF PART A AND B COVERAGE
STACK THEM TOGETHER VIA UNION ALL FUNCTION

*/

CREATE TABLE main_table AS
SELECT
	b8.DESYNPUF_ID AS member_id,
	2008 AS year,
	b8.BENE_HI_CVRAGE_TOT_MONS AS member_months,
	b8.MEDREIMB_IP AS inpatient_reimbursement,
	b8.MEDREIMB_OP AS outpatient_reimbursement,
	b8.MEDREIMB_CAR AS carrier_reimbursement
FROM
	bene2008 b8
WHERE
	b8.BENE_HMO_CVRAGE_TOT_MONS = 0
	AND b8.BENE_HI_CVRAGE_TOT_MONS > 0
	AND b8.BENE_HI_CVRAGE_TOT_MONS = b8.BENE_SMI_CVRAGE_TOT_MONS
UNION ALL
SELECT
	b9.DESYNPUF_ID AS member_id,
	2009 AS year,
	b9.BENE_HI_CVRAGE_TOT_MONS AS member_months,
	b9.MEDREIMB_IP AS inpatient_reimbursement,
	b9.MEDREIMB_OP AS outpatient_reimbursement,
	b9.MEDREIMB_CAR AS carrier_reimbursement
FROM
	bene2009 b9
WHERE
	b9.BENE_HMO_CVRAGE_TOT_MONS = 0
	AND b9.BENE_HI_CVRAGE_TOT_MONS > 0
	AND b9.BENE_HI_CVRAGE_TOT_MONS = b9.BENE_SMI_CVRAGE_TOT_MONS;

/*
  
RESULTS:
150,631 TOTAL ROWS
 
member_id       |year|member_months|inpatient_reimbursement|outpatient_reimbursement|carrier_reimbursement|
----------------+----+-------------+-----------------------+------------------------+---------------------+
0000838E2BBC2ADA|2008|           12|                21000.0|                  2390.0|               6710.0|
0001B0072BCFE957|2008|           12|                13000.0|                   700.0|                490.0|
0001C1282A826D10|2008|           12|                    0.0|                     0.0|               3490.0|
000270BDE7154CB6|2008|           12|                    0.0|                  1000.0|               1350.0|
00035F17586E6A10|2008|           12|                    0.0|                   780.0|                810.0|

*/