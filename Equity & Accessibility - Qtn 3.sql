-- Are unemployed or retired patients more likely to have claims denied compared to employed patients?
SELECT PatientEmploymentStatus,
       ROUND(SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END)*100/ COUNT(*),2) AS ClaimDenialRate
FROM enhanced_health_insurance_claims
WHERE PatientEmploymentStatus IN ('Retired','Employed','Unemployed')
GROUP BY PatientEmploymentStatus
ORDER BY ClaimDenialRate DESC;