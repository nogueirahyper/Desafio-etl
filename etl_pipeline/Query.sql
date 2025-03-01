SELECT branch,city,quantity,total,`date`,`time`,cogs,rating,


CASE 
  WHEN REGEXP_CONTAINS(LOWER(customer_type), r'member') THEN 'Membro' 
  ELSE 'Não membro' 
END AS tipo_cliente,


CASE 
  WHEN REGEXP_CONTAINS(LOWER(gender), r'female') THEN 'Feminino' 
  ELSE 'Masculino' 
END AS genero,

CASE 
  WHEN REGEXP_CONTAINS(LOWER(payment), r'cash') THEN 'Dinheiro'
  WHEN REGEXP_CONTAINS(LOWER(payment), r'credit card') THEN 'Cartão de credito'  
  ELSE 'Carteira virtual' 
END AS pagamento,

CASE 
  WHEN REGEXP_CONTAINS(LOWER(product_line), r'food and beverages') THEN 'alimentos e bebidas'
  WHEN REGEXP_CONTAINS(LOWER(product_line), r'electronic accessories') THEN 'Acessórios eletrônicos'
  WHEN REGEXP_CONTAINS(LOWER(product_line), r'sports and travel') THEN 'Esportes e viagens'
  WHEN REGEXP_CONTAINS(LOWER(product_line), r'home and lifestyle') THEN 'Casa e estilo de vida'
  WHEN REGEXP_CONTAINS(LOWER(product_line), r'health and beauty') THEN 'Saúde e beleza'
  ELSE 'Acessórios de moda' 
END AS produtos,



CASE WHEN 
EXTRACT(HOUR FROM TIME(time)) >= 0 and EXTRACT(HOUR FROM TIME(time)) <= 5 THEN 'Madrugada'
WHEN EXTRACT(HOUR FROM TIME(time)) >= 6 and EXTRACT(HOUR FROM TIME(time)) <= 12 THEN 'Manhã'
WHEN EXTRACT(HOUR FROM TIME(time)) >= 13 and EXTRACT(HOUR FROM TIME(time)) <= 18 THEN 'Tarde'
WHEN EXTRACT(HOUR FROM TIME(time)) >= 19 and EXTRACT(HOUR FROM TIME(time)) <= 23 THEN 'Noite'
ELSE 'Outro'
END AS Periodo
From `etl-am.dataset_etl.gcs_to_bq_transfer`








-- tratamentos nulos
WHERE branch IS NOT NULL
  AND city IS NOT NULL
  AND customer_type IS NOT NULL
  AND gender IS NOT NULL
  AND product_line IS NOT NULL
  AND quantity IS NOT NULL
  AND total IS NOT NULL
  AND `date` IS NOT NULL
  AND `time` IS NOT NULL
  AND payment IS NOT NULL
  AND cogs IS NOT NULL
  AND rating IS NOT NULL;
