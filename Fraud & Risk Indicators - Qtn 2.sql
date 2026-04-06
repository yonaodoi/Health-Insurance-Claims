-- Which patients have the highest number of emergency claims beyond a certain threshold (Count > 3, Emergency Claim Amount > 50000)?  
SELECT PatientID, SUM(ClaimAmount) AS EmergencyClaimAmount, COUNT(ClaimID) AS EmergencyClaimCount
FROM enhanced_health_insurance_claims
WHERE ClaimType = 'Emergency'
GROUP BY PatientID
HAVING EmergencyClaimAmount > 50000 AND EmergencyClaimCount > 3
ORDER BY EmergencyClaimCount DESC
LIMIT 1;