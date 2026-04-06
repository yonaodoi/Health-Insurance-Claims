-- What is the average claim amount and approval rate by patient age group?
SELECT 
      CASE
        WHEN PatientAge BETWEEN 0 AND 29 THEN 'Young (0-29)'
        WHEN PatientAge BETWEEN 30 AND 59 THEN 'Middle_Age (30-59)'
        WHEN PatientAge BETWEEN 60 AND 99 THEN 'Senior (60-99)'
	  END AS AgeGroup,
      ROUND(AVG(ClaimAmount),2) AS AverageClaimAmount,
      ROUND(SUM(CASE WHEN ClaimStatus = 'Approved' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS ApprovalRate
FROM enhanced_health_insurance_claims
GROUP BY AgeGroup
ORDER BY ApprovalRate DESC;