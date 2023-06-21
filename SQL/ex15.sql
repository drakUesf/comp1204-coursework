SELECT caseAndDeath.dateRep, cases
FROM caseAndDeath
INNER JOIN Date ON Date.dateRep = caseAndDeath.dateRep
WHERE caseAndDeath.geoId = 'UK'
ORDER BY year,month,day ASC;