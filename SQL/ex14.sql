ALTER TABLE caseAndDeath ADD totalDeaths integer;
UPDATE caseAndDeath
SET totalDeaths = (SELECT SUM(deaths) FROM caseAndDeath);

ALTER TABLE caseAndDeath ADD totalCases integer;
UPDATE caseAndDeath
SET totalCases = (SELECT SUM(cases) FROM caseAndDeath);

