WITH BIKE AS (

    SELECT
    RIDE_ID,
    REPLACE(STARTED_AT,'"','') AS STARTED_AT,
    REPLACE(ENDED_AT,'"','') AS ENDED_AT,
    START_STATION_NAME,
    START_STATIO_ID AS START_STATION_ID,
    END_STATION_ID,
    END_STATION_NAME,
    START_LAT,
    START_LNG,
    END_LAT,
    END_LNG,
    MEMBER_CSUAL

    from {{ source('demo', 'bike') }}
    WHERE RIDE_ID != '"bikeid"' and STARTED_AT != '"starttime"' and STARTED_AT != 'starttime'
)

SELECT
*
FROM BIKE 