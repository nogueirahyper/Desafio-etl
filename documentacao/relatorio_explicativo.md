Relatório de Implementação do Pipeline ETL para Análise de Vendas de Supermercado
1. Introdução
Este documento detalha o processo de implementação de um pipeline ETL (Extração, Transformação e Carga) para analisar dados de vendas de supermercado. O objetivo é fornecer insights valiosos através da visualização dos dados utilizando o Looker Studio. O fluxo de trabalho abrange desde a obtenção dos dados até a criação de dashboards interativos.

2. Obtenção dos Dados
A base de dados utilizada foi obtida do Kaggle, especificamente do conjunto de dados "Supermarket Sales" disponível em https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales/data. Este conjunto contém registros detalhados de vendas, incluindo informações sobre produtos, clientes e transações.

3. Armazenamento e Preparação dos Dados
3.1. Importação para o PostgreSQL
Após o download do arquivo CSV, os seguintes passos foram realizados:

Criação da Tabela no PostgreSQL: Uma tabela foi criada para armazenar os dados, definindo invoice_id como chave primária para garantir a unicidade de cada transação.

Importação dos Dados: Utilizando a ferramenta pgAdmin, os dados do CSV foram importados para a tabela criada. Este processo envolveu a correspondência das colunas do CSV com as colunas da tabela no banco de dados.

Criação de Índices: Para otimizar as consultas, foram criados índices nas colunas mais frequentemente utilizadas em filtros e junções, como branch, city e product_line.

3.2. Exportação para o Google Cloud Storage (GCS)
Para integrar os dados ao Google BigQuery, os seguintes passos foram executados:

Exportação dos Dados: Os dados foram exportados do PostgreSQL para um arquivo CSV utilizando a função COPY do PostgreSQL:

sql
Copiar
Editar
COPY sales TO '/caminho/para/sales_export.csv' WITH CSV HEADER;
Upload para o GCS: O arquivo sales_export.csv foi carregado para um bucket no GCS chamado dados_brutos_etl.

4. Integração com o BigQuery
Com os dados no GCS, procedeu-se à carga no BigQuery:

Criação de Conjunto de Dados: No BigQuery, foi criado um conjunto de dados para armazenar as tabelas relacionadas ao projeto.

Configuração da Transferência de Dados: Utilizando o recurso de transferência de dados do BigQuery, foi configurada uma transferência chamada gcs_to_bq para importar os dados do arquivo CSV no GCS para uma tabela no BigQuery. A configuração permitiu até 1 erro durante a importação para lidar com possíveis inconsistências nos dados.

5. Transformação e Limpeza dos Dados
Dentro do BigQuery, foram realizadas as seguintes etapas de transformação:

Criação de Tabelas Temporárias: Para manipulação e limpeza dos dados, foram criadas tabelas temporárias baseadas na tabela importada.

Aplicação de Filtros e Limpeza: Consultas SQL foram executadas para:

Tratar valores nulos ou inconsistentes.
Converter dados (por exemplo do inglês para o Português).
Normalizar textos para manter a consistência (como padronização de maiúsculas/minúsculas).
Salvamento dos Dados Tratados: Após as transformações, os dados limpos foram salvos em uma nova tabela no BigQuery, pronta para análise.

6. Visualização com Looker Studio
Para a criação de dashboards interativos:

Conexão com o BigQuery: No Looker Studio, foi estabelecida uma conexão direta com a tabela de dados tratados no BigQuery.

Desenvolvimento do Dashboard: Foram criadas diversas visualizações, incluindo gráficos e tabelas, para destacar métricas-chave como:

Vendas por filial e cidade.
Desempenho por linha de produto.
Análise de métodos de pagamento preferidos.
Tendências de vendas ao longo do tempo.
Interatividade: Filtros e controles foram adicionados ao dashboard para permitir que os usuários explorem os dados de acordo com diferentes dimensões e métricas.

7. Considerações Finais
Este projeto demonstrou a implementação de um pipeline ETL completo, desde a extração de dados brutos até a visualização de insights acionáveis. A escolha das ferramentas, como PostgreSQL, Google Cloud Storage, BigQuery e Looker Studio, proporcionou uma integração eficiente e escalável, facilitando a análise e a tomada de decisões baseadas em dados.

