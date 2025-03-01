SET datestyle = 'ISO, MDY';
\copy sales FROM 'C:/Users/Desktop-Nog/Desktop/supermarket_sales.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
