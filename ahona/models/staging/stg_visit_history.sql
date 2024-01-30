{{congig(materialized='view')}}

WITH raw_visit_history AS
(
    SELECT
       customer_id,
       channel_id,
       visit_timestanp,
       bounce_timestamp,
       created_at,
       updated_at

    FROM {{source('public','visithistory')}}
)
SELECT
    *
FROM raw_visit_history