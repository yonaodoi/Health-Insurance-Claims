--  What is the average claim amount by patient age group and income bracket?

     -- Age Groups (3 buckets); 0–29 → Young , 30–59 → Middle Age, 	60–99 → Senior
	 -- Income Brackets (3 buckets); Low Income → 20,000 – 50,000, 	Middle Income → 50,001 – 100,000 ,	High Income → 100,001 – 150,000

SELECT 
   CASE 
    WHEN PatientAge >=0 AND PatientAge<= 29 THEN "Young(0-29)"
    WHEN PatientAge >=30 AND PatientAge<= 59 THEN "Middle_Age(30-59)"
    WHEN PatientAge >=60 AND PatientAge<= 99 THEN "Senior(60-99)"
   END AS AgeGroup,
  CASE
    WHEN PatientIncome >= 20000 AND PatientIncome <= 50000 THEN "Low_Income(20k-50k)"
    WHEN PatientIncome >= 50001 AND PatientIncome <= 100000 THEN "Middle_Income(>50k-100k)"
    WHEN PatientIncome >= 100001 AND PatientIncome <= 150000 THEN "High_Income(>100k-150k)"
  END AS IncomeBracket,
  ROUND(AVG(ClaimAmount),2) AS Avg_ClaimAmoun
FROM enhanced_health_insurance_claims
GROUP BY AgeGroup, IncomeBracket
ORDER BY AgeGroup, IncomeBracket;
