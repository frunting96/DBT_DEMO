WITH BIKE as (

SELECT
distinct
start_statio_id AS station_id,
start_station_name AS station_name,
start_lat,
start_lng
FROM {{ source('demo', 'bike') }}
limit 10

)

SELECT * FROM BIKE