SELECT country.countriesAndTerritories AS country,
    round(sum(caseAndDeath.cases)* 1.0 / country.popData2020 * 100, 2) AS casesPercentage,
    round(sum(caseAndDeath.deaths)* 1.0 / country.popData2020 * 100, 2) AS deathsPercentage
FROM caseAndDeath
JOIN country ON caseAndDeath.geoId = country.geoId
GROUP BY countriesAndTerritories, popData2020
