SELECT caseAndDeath.dateRep AS date,
    SUM(cases) OVER (PARTITION BY geoid ORDER BY caseAndDeath.dateRep ASC) AS cases1,
    SUM(deaths) OVER (PARTITION BY geoid ORDER BY caseAndDeath.dateRep ASC) AS deaths1
FROM caseAndDeath
JOIN date
ON date.dateRep = caseAndDeath.dateRep
WHERE geoId = 'UK'
ORDER BY year, month, day ASC;
