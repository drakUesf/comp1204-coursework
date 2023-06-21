create table caseAndDeath
(
    dateRep TEXT not null,
    geoId   TEXT not null,
    deaths  integer,
    cases   integer,
    constraint caseAndDeath_pk
        primary key (dateRep, geoId)
);

create table country
(
    geoId                   TEXT    not null
        constraint country_pk
            primary key,
    countriesAndTerritories TEXT    not null,
    countryterritoryCode    TEXT    not null,
    popData2020             INTEGER not null,
    continentExp            TEXT    not null
);

create table date
(
    dateRep TEXT    not null
        constraint date_pk
            primary key,
    day     integer not null,
    month   integer not null,
    year    integer not null
);
