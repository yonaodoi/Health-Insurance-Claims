-- 	Which provider specialties have the highest denial rates?
SELECT ProviderSpecialty,
       SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END) AS ClaimDenial,
       COUNT(*) AS ClaimCount,
       ROUND(SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END)*100 / COUNT(*),2) AS ClaimDenialRate
FROM enhanced_health_insurance_claims
GROUP BY ProviderSpecialty
ORDER BY ClaimDenialRate DESC;