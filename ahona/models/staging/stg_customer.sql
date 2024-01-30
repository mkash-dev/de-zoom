{{config(materialized='view')}}

WITH raw_customers AS
(
    SELECT
       customer_id,
       customer_name,
       date_of_birth,
       email_address,
       phone_number,
       country,
       created_at,
       updated_at

    FROM {{source('public','customer')}}
)
SELECT 
    *
FROM raw_customers