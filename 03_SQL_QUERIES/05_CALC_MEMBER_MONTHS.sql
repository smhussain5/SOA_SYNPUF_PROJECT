/*

GOAL: CALCULATE MEMBER MONTHS
 
COUNT TOTAL MEMBERS, SUM MEMBER MONTHS, AND CALCULATE AVERAGE MEMBER MONTHS
GROUP BY YEAR

*/

SELECT
	mt.year,
	COUNT(*) AS total_members,
	SUM(mt.member_months) AS total_member_months,
	ROUND(AVG(mt.member_months), 2) AS avg_member_months
FROM
	main_table mt
GROUP BY
	mt.year
ORDER BY
	mt.year;

/*
  
RESULTS:
2 TOTAL ROWS
 
year|total_members|total_member_months|avg_member_months|
----+-------------+-------------------+-----------------+
2008|        78002|             910678|            11.68|
2009|        72629|             870883|            11.99|

*/