WITH source AS (
    SELECT
        incident_id,
        CAST(stock_ticker AS CHAR(10)) AS stock_ticker,
        CAST(price_7d_before AS DECIMAL(18,2)) AS price_7d_pre,
        CAST(price_disclosure_day AS DECIMAL(18,2)) AS price_on_disclosure_day,
        CAST(price_1d_after AS DECIMAL(18,2)) AS price_1d_post,
        CAST(price_7d_after AS DECIMAL(18,2)) AS price_7d_post,
        CAST(price_30d_after AS DECIMAL(18,2)) AS price_30d_post,
        volume_avg_30d_baseline,
        volume_disclosure_day,
        CAST(sector_index AS CHAR(50)) AS sector_index,
        CAST(sector_return_same_period AS DECIMAL(10,6)) AS sector_return_same_period,
        CAST(abnormal_return_1d AS DECIMAL(10,6)) AS abnormal_return_1d,
        CAST(abnormal_return_7d AS DECIMAL(10,6)) AS abnormal_return_7d,
        CAST(abnormal_return_30d AS DECIMAL(10,6)) AS abnormal_return_30d,
        CAST(car_neg1_to_pos1 AS DECIMAL(10,6)) AS car_neg1_to_pos1,
        CAST(car_0_to_7 AS DECIMAL(10,6)) AS car_0_7,
        CAST(car_0_to_30 AS DECIMAL(10,6)) AS car_0_30,
        CAST(car_0_to_90 AS DECIMAL(10,6)) AS car_0_90,
        CAST(t_statistic_1d AS DECIMAL(10,6)) AS t_statistic_1d,
        CAST(t_statistic_30d AS DECIMAL(10,6)) AS t_statistic_30d,
        CAST(p_value_30d AS DECIMAL(10,6)) AS p_value_30d,
        earnings_announcement_within_7d,
        CAST(market_cap_at_disclosure AS DECIMAL(18,2)) AS market_cap_at_disclosure,
        CAST(volume_ratio_disclosure AS DECIMAL(5,4)) AS volume_ratio_disclosure,
        CAST(pre_incident_volatility_30d AS DECIMAL(7,6)) AS pre_incident_volatility_30d,
        CAST(post_incident_volatility_30d AS DECIMAL(7,6)) AS post_incident_volatility_30d,
        days_to_price_recovery,
        notes,
        created_at,
        updated_at
    FROM {{ source("raw", "raw_market_impact") }}
)

SELECT * FROM source
