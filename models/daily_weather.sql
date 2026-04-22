WITH daily_weather as (

    SELECT
    pressure,
    date(time) as daily_weather,
    weather,
    temp,
    humidity,
    clouds
    FROM {{ source('demo', 'weather') }}
),
daily_weather_agg as(
SELECT
daily_weather,
weather,
round(avg(temp),2) as avg_temp,
round(avg(pressure),2) as avg_pressure,
avg(humidity) as avg_humidity,
avg(clouds) as avg_clouds
FROM daily_weather
GROUP BY daily_weather, weather
qualify ROW_NUMBER() OVER(PARTITION BY DAILY_WEATHER ORDER BY count(weather) desc) = 1 -- 윈도우함수를 필터링 하는 기능
)

SELECT * FROM daily_weather_agg
