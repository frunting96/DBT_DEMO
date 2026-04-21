-- 날짜 정보의 집합 테이블
-- BIKE 테이블의 STARTED_DATE 정보를 자세하게 쪼개서 dimension 테이블을 제작하는 쿼리입니다.


WITH CTE AS (
    
    SELECT
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    {{day_type('STARTED_AT')}} AS DAY_TYPE,
    {{get_season('STARTED_AT')}} AS STATION_OF_YEAR

    FROM
    {{ source('demo', 'bike') }}
    WHERE STARTED_AT != 'started_at'
)

SELECT * FROM CTE