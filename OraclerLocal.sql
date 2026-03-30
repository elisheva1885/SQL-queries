

--CREATE TABLE currency_rates(id NUMBER ,country_name VARCHAR(50) , currency_code VARCHAR(10),value NUMBER, rate_date DATE)

--Task1
--SELECT count(id) 
--FROM currency_rates

--Task2
--SELECT DISTINCT currency_code
--FROM currency_rates

--Task3
--SELECT currency_code, MAX(value) AS max_value, MIN(value) AS min_value
--FROM currency_rates
--GROUP BY currency_code

--Task 4
--SELECT cr2.rate_date, cr2.best_for_date, cr1.currency_code , cr1.country_name
--FROM currency_rates cr1
--JOIN (
--  SELECT MIN(value) AS best_for_date , TRUNC(rate_date) AS rate_date
--  FROM currency_rates
--  GROUP BY TRUNC(rate_date)
--) cr2
--ON TRUNC(cr1.rate_date) = cr2.rate_date
--AND cr1.value = cr2.best_for_date
--
--SELECT rate_date, value AS best_for_date, currency_code , country_name
--FROM(
--SELECT cr.*,  
--  RANK ()
--  OVER( PARTITION BY TRUNC(rate_date) ORDER BY value ASC) AS rn
--FROM currency_rates cr
--) 
--WHERE rn = 1

--Task5
SELECT country_name,currency_code, rate_date AS last_update , value AS to_euro,
TRUNC( 
    CASE 
        WHEN value!=0 THEN 1/value
    END
, 5) AS from_euro
FROM
(SELECT cr.*,
ROW_NUMBER ()
    OVER( PARTITION BY currency_code ORDER BY rate_date DESC) AS rn
FROM currency_rates cr )
WHERE rn=1
ORDER BY 1/value ASC

