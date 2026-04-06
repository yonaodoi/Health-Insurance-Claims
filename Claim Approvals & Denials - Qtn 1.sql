-- What is the approval vs denial rate by claim submission method (online, paper, phone)?

SELECT ClaimSubmissionMethod, 
       SUM(CASE WHEN ClaimStatus = 'Approved' THEN 1 ELSE 0 END) AS ClaimApproval,
       SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END) AS ClaimDenial,
       COUNT(*) AS ClaimCount,
       ROUND(SUM(CASE WHEN ClaimStatus = 'Denied' THEN 1 ELSE 0 END) *100 / COUNT(*),2) AS ClaimDenialRate,
       ROUND(SUM(CASE WHEN ClaimStatus = 'Approved' THEN 1 ELSE 0 END) *100 / COUNT(*),2) AS ClaimApprovalRate       
FROM enhanced_health_insurance_claims
GROUP BY ClaimSubmissionMethod
ORDER BY ClaimDenialRate DESC;
