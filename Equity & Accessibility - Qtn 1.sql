-- Do claim outcomes (approval/denial) differ significantly by patient income bracket?
 SELECT  
        CASE
          WHEN PatientIncome BETWEEN 20000 AND 50000 THEN 'Low_income (20k-50k)'
          WHEN PatientIncome BETWEEN 50001 AND 100000 THEN 'Middle_income (50k-100k)'
          WHEN PatientIncome BETWEEN 100001 AND 150000 THEN 'High_income (100k-150k)'
		END AS IncomeBracket,
        ROUND(SUM(CASE WHEN ClaimStatus = 'Approved' THEN 1 ELSE 0 END) * 100 / COUNT(*),2) AS ApprovalRate,
        ROUND(SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END) * 100 / COUNT(*),2) AS DenialRate
 FROM enhanced_health_insurance_claims
 GROUP BY IncomeBracket
 ORDER BY ApprovalRate DESC;