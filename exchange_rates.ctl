load data 
infile 'exchange_rates.csv' "str '\n'"
append
into table CURRENCY_RATES
fields terminated by ','
OPTIONALLY ENCLOSED BY '"' AND '"'
trailing nullcols
           ( ID,
             COUNTRY_NAME CHAR(50),
             CURRENCY_CODE CHAR(10),
             VALUE,
             RATE_DATE DATE "DD/MM/YYYY"
           )
