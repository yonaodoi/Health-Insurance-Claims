-- How do approval rates vary across patient demographics (gender, income, employment status)?
SELECT PatientGender,PatientEmploymentStatus,
     CASE 
       WHEN PatientIncome BETWEEN 20000 AND 50000 THEN 'Low_income(20k-50k)'
       WHEN PatientIncome BETWEEN 50001 AND 100000 THEN 'Middle_income(50k-100k)'
       WHEN PatientIncome BETWEEN 100001 AND 150000 THEN 'High_income(100k-150k)'
	 END AS IncomeBracket,
     SUM(CASE WHEN ClaimStatus = 'Approved' THEN 1 ELSE 0 END) AS ClaimApproval,
     COUNT(*) AS ClaimCount,
     ROUND(SUM(CASE WHEN ClaimStatus = 'Approved' THEN 1 ELSE 0 END)*100 /COUNT(*),2) AS ClaimApprovalRate
FROM enhanced_health_insurance_claims
GROUP BY PatientGender,PatientEmploymentStatus,IncomeBracket
ORDER BY ClaimApprovalRate DESC;