WITH BIKE as (

SELECT
distinct
start_station_id AS station_id,
start_station_name AS station_name,
start_lat,
start_lng
FROM {{ ref('stg_bike') }}

)

SELECT * FROM BIKE