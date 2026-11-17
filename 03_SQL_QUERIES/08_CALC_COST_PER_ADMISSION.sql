/*

GOAL: CALCULATE COSTS PER ADMISSIONS 

LEFT JOIN MAIN TABLE WITH INPATIENT VIEW
SUM MEMBER MONTHS, ADMISSIONS, AND INPATIENT CLAIM PAYMENTS
CALCULATE COST PER ADMISSIONS
GROUP BY YEAR

*/

SELECT
	mt.year,
	SUM(mt.member_months) AS member_months,
	SUM(COALESCE(iv.admissions, 0)) AS admissions,
	SUM(COALESCE(iv.inpatient_payment, 0)) AS inpatient_payment,
	ROUND(SUM(COALESCE(iv.inpatient_payment, 0)) / SUM(COALESCE(iv.admissions, 0)), 2) AS cost_per_admission
FROM
	main_table mt
LEFT JOIN ip_view iv ON
	iv.member_id = mt.member_id
	AND iv.year = mt.year
GROUP BY
	mt.year
ORDER BY
	mt.year
	
/*
  
RESULTS:
2 TOTAL ROWS
 
year|member_months|admissions|inpatient_payment|cost_per_admission|
----+-------------+----------+-----------------+------------------+
2008|       910678|     20122|        190566350|           9470.55|
2009|       870883|     17037|        164599920|           9661.32|

*/