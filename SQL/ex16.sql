SELECT country.countriesAndTerritories AS country, 
caseAndDeath.dateRep AS date,
caseAndDeath.cases, 
caseAndDeath.deaths
FROM caseAndDeath
JOIN date 
ON date.dateRep = caseAndDeath.dateRep
JOIN country
ON caseAndDeath.geoId = country.geoId 
GROUP BY country, date
ORDER BY caseAndDeath.geoId ASC, year, month, day ASC;