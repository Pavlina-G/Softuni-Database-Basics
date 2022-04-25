SELECT `country_name`, `iso_code` FROM countries
WHERE country_name LIKE '%A%A%A%'
ORDER BY iso_code;

SELECT 
    `country_name`, `iso_code`
FROM
    countries
WHERE
    (CHAR_LENGTH(country_name) - CHAR_LENGTH(REPLACE(UPPER(`country_name`), 'A', ''))) >= 3
ORDER BY iso_code;

SELECT peaks.peak_name, rivers.river_name, lower(concat(peaks.peak_name, substr(rivers.river_name, 2))) AS 'mix' FROM peaks, rivers
WHERE substr(peaks.peak_name, -1, 1) = substr(rivers.river_name, 1, 1)
ORDER BY mix;
