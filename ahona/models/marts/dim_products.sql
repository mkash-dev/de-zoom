{{config(materialized='view')}}

WITH stg_dim_products AS
 (
    SELECT
       product_sku AS nk_product_sku,
       product_name AS dsc_product_name,
       unit_price AS mtr_unit_price,
       created_at AS dt_created_at,
       updated_at AS dt_updated_at

    FROM {{ref('stg_raw_products.sql')}}

 )

 SELECT
    {{dbt_utils.generate_surrogate_key(['nk_product_sku'])}},
    *
 FROM stg_dim_products

 {{dbt_date.get_date_dimension('2022-01-01','2024-12-31')}}
