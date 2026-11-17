/*

GOAL: CALCULATE PMPM BY SERVICE CATEGORY
 
COUNT TOTAL MEMBERS, SUM MEMBER MONTHS, SUM INPATIENT REIMBURSEMENT, SUM OUTPATIENT REIMBURSEMENT, AND SUM CARRIER REIMBURSEMENT
CALCULATE SERVICE REIMBURSEMENT PER MEMBER MONTH 
GROUP AND ORDER BY YEAR

*/

SELECT
	mt.year,
	COUNT(*) AS total_members,
	SUM(mt.member_months) AS member_months,
	SUM(mt.inpatient_reimbursement) AS ip_reimbursed,
	SUM(mt.outpatient_reimbursement) AS op_reimbursed,
	SUM(mt.carrier_reimbursement) AS carrier_reimbursed,
	ROUND(SUM(mt.inpatient_reimbursement) / SUM(mt.member_months), 2) AS ip_reimbursement_pmpm,
	ROUND(SUM(mt.outpatient_reimbursement) / SUM(mt.member_months), 2) AS op_reimbursement_pmpm,
	ROUND(SUM(mt.carrier_reimbursement) / SUM(mt.member_months), 2) AS carrier_reimbursement_pmpm,
	ROUND((SUM(mt.inpatient_reimbursement) + SUM(mt.outpatient_reimbursement) + SUM(mt.carrier_reimbursement))/(SUM(mt.member_months)), 2) AS total_pmpm
FROM
	main_table mt
GROUP BY
	mt.year
ORDER BY
	mt.year
	
/*

RESULTS:
2 TOTAL ROWS

year|total_members|member_months|ip_reimbursed|op_reimbursed|carrier_reimbursed|ip_reimbursement_pmpm|op_reimbursement_pmpm|carrier_reimbursement_pmpm|total_pmpm|
----+-------------+-------------+-------------+-------------+------------------+---------------------+---------------------+--------------------------+----------+
2008|        78002|       910678|    191043220|     52961970|         101647910|               209.78|                58.16|                    111.62|    379.56|
2009|        72629|       870883|    167916100|     59444760|         106508650|               192.81|                68.26|                     122.3|    383.37|

*/