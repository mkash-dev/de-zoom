{{config(materialized='view')}}

WITH raw_history  AS
(
    SELECT
       customer_id,
       product_sku,
       channel_id,
       quantity,
       discount,
       order_date,
       created_at,
       updated_at

    FROM {{source('public', 'purchasesellhistory')}}
)
SELECT 
  *
FROM raw_history