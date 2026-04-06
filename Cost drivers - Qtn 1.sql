-- Which provider specialties and claim types contribute the highest total claim amounts?
SELECT ProviderSpecialty, ClaimType, ROUND(SUM(ClaimAmount),2) AS TotalClaimAmount
FROM enhanced_health_insurance_claims
GROUP BY ProviderSpecialty,ClaimType
ORDER BY TotalClaimAmount DESC;
