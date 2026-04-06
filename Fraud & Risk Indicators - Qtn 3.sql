-- Which providers or patients have the highest denial-to-approval ratio?
SELECT ProviderSpecialty,
       SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END) AS ClaimDenial,
       SUM(CASE WHEN ClaimStatus = 'Approved' THEN 1 ELSE 0 END) AS ClaimApproval,
       CASE
         WHEN SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END) = 0 THEN NULL
	     ELSE ROUND(SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END) /SUM(CASE WHEN ClaimStatus = 'Approved' THEN 1 ELSE 0 END),2)
	   END AS Denial_approval_ratio     
FROM enhanced_health_insurance_claims
GROUP BY ProviderSpecialty
ORDER BY Denial_approval_ratio DESC;