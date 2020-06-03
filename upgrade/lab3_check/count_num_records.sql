SET SERVEROUTPUT ON;

WITH table_for_count AS (
    SELECT 'product' AS tablename, COUNT(*) data_num
    FROM product group by 'product'
    UNION ALL
    SELECT 'box' AS, COUNT(*) AS data_num
    FROM box group by 'box'
    UNION ALL
    SELECT 'storage', COUNT(*) AS data_num
    FROM storage group by 'storage'
    UNION ALL
    SELECT 'transport', COUNT(*) AS data_num
    FROM transport group by 'transport'
    UNION ALL
    SELECT 'batch', COUNT(*) AS data_num
    FROM batch group by 'batch'
    UNION ALL
    SELECT 'batch_content', COUNT(*) AS data_num
    FROM batch_content group by 'batch_content'
    UNION ALL
    SELECT 'customer', COUNT(*) AS data_num
    FROM customer group by 'customer'
    UNION ALL
    SELECT 'ingredients', COUNT(*) AS data_num
    FROM ingredients group by 'ingredients'
)
SELECT table_for_count.tablename || ' - number of values: ' || table_for_count.data_num AS tables
FROM table_for_count;

SET SERVEROUTPUT OFF;