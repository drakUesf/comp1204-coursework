SELECT
    country.countriesAndTerritories AS country,
    round((SUM(caseAndDeath.deaths) * 1.0 / SUM(caseAndDeath.cases)) * 100, 2) AS deathRate
FROM caseAndDeath
JOIN country ON caseAndDeath.geoId = country.geoId
GROUP BY country.countriesAndTerritories
ORDER BY deathRate DESC
LIMIT 10;
