-- 날짜 정보의 집합 테이블
-- BIKE 테이블의 STARTED_DATE 정보를 자세하게 쪼개서 dimension 테이블을 제작하는 쿼리입니다.


WITH CTE AS (
    
    SELECT
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    CASE
    WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sat','Sun')
        THEN 'WEEKEND'
        ELSE 'BUISNESSDAY'
        END AS DAY_TYPE,
    CASE WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (12,1,2)
        THEN 'WINTER'
        WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
        THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
        THEN 'SUMMER'
         WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (9,10,11)
         THEN 'AUTUMN'
         END AS STATION_OF_YEAR
    FROM
    {{ source('demo', 'bike') }}
    WHERE STARTED_AT != 'started_at'
)

SELECT * FROM CTE