WITH incidents_master AS (
    SELECT
        incident_id,
        company_name,
        company_revenue_usd,
        CASE
            WHEN company_revenue_usd < 100000000 THEN 'small'
            WHEN company_revenue_usd < 1000000000 THEN 'medium'
            WHEN company_revenue_usd >= 1000000000 THEN 'high'
            ELSE 'unknown'
        END AS revenue_size,
        country_iso2,
        industry_primary,
        industry_secondary,
        CASE
            WHEN employee_count < 1000 THEN 'small'
            WHEN employee_count < 10000 THEN 'medium'
            WHEN employee_count >= 10000 THEN 'large'
            ELSE 'unknown'
        END AS company_size,
        employee_count,
        is_public_company,
        stock_ticker,
        incident_date,
        EXTRACT(YEAR FROM incident_date) AS incident_year,
        EXTRACT(MONTH FROM incident_date) AS incident_month,
        incident_date_estimated,
        disclosure_date,
        attack_vector_primary,
        attack_vector_secondary,
        attack_chain,
        attributed_group,
        attribution_confidence,
        CASE
            WHEN data_compromised_records < 100000 THEN 'low'
            WHEN data_compromised_records < 1000000 THEN 'medium'
            WHEN data_compromised_records >= 1000000 THEN 'large'
            ELSE 'unknown'
        END AS breach_severity,
        data_compromised_records,
        data_type_affected,
        systems_affected,
        downtime_hours,
        data_source_primary,
        data_source_secondary,
        data_source_type,
        confidence_tier,
        quality_score,
        quality_grade,
        review_flag,
        notes,
        created_at,
        updated_at
    FROM {{ ref("stg_incidents_master") }}
)

SELECT * FROM incidents_master