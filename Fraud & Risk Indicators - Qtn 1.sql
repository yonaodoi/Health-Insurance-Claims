-- Which providers submit the most claims overall?  
SELECT ProviderSpecialty, COUNT(ClaimID) AS ClaimCount
FROM enhanced_health_insurance_claims
GROUP BY ProviderSpecialty
ORDER BY ClaimCount DESC
LIMIT 5;