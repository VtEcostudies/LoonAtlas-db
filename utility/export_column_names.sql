COPY (
SELECT concat('{table-name}."', column_name,'",') AS vpmapped_column_names
  FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = '{table-name}'
)
TO 'C:\Users\jloomis\Documents\VCE\{database-name}_{table-name}_columns.txt' with NULL '';
