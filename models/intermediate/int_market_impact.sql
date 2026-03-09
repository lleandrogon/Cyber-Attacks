WITH market_impact AS (
    SELECT
        incident_id,
        stock_ticker,
        price_7d_pre,
        price_on_disclosure_day,
        (price_on_disclosure_day - price_7d_pre) / price_7d_pre AS return_pct_disclosure,
        price_1d_post,
        price_7d_post,
        price_30d_post,
        volume_avg_30d_baseline,
        volume_disclosure_day,
        sector_index,
        sector_return_same_period,
        CASE
            WHEN abnormal_return_1d > 0 THEN 1
            ELSE 0
        END AS immediate_impact,
        abnormal_return_1d,
        abnormal_return_7d,
        abnormal_return_30d,
        CASE
            WHEN abnormal_return_30d > 0 THEN 1
            ELSE 0
        END AS impact_30d,
        car_neg1_to_pos1,
        car_0_7,
        car_0_30,
        car_0_90,
        t_statistic_1d,
        t_statistic_30d,
        p_value_30d,
        earnings_announcement_within_7d,
        market_cap_at_disclosure,
        volume_ratio_disclosure,
        pre_incident_volatility_30d,
        post_incident_volatility_30d,
        post_incident_volatility_30d - pre_incident_volatility_30d AS volatility_change_30d,
        days_to_price_recovery,
        notes,
        created_at,
        updated_at
    FROM {{ ref("stg_market_impact") }}
)

SELECT * FROM market_impact