WITH source AS (
    SELECT
        incident_id,
        CAST(company_name AS CHAR(100)) AS company_name,
        CAST(company_revenue_usd AS DECIMAL(18,2)) AS company_revenue_usd,
        CAST(country_hq AS CHAR(2)) AS country_iso2,
        CAST(industry_primary AS CHAR(5)) AS industry_primary,
        CAST(industry_secondary AS CHAR(5)) AS industry_secondary,
        employee_count,
        is_public_company,
        CAST(stock_ticker AS CHAR(10)) AS stock_ticker,
        incident_date,
        incident_date_estimated,
        discovery_date,
        disclosure_date,
        CAST(attack_vector_primary AS CHAR(20)) AS attack_vector_primary,
        CAST(attack_vector_secondary AS CHAR(20)) AS attack_vector_secondary,
        attack_chain,
        CAST(attributed_group AS CHAR(30)) AS attributed_group,
        CAST(attribution_confidence AS CHAR(15)) AS attribution_confidence,
        data_compromised_records,
        CAST(data_type AS CHAR(15)) AS data_type_affected,
        CAST(systems_affected AS CHAR(255)) AS systems_affected,
        CAST(downtime_hours AS DECIMAL(6,2)) AS downtime_hours,
        data_source_primary,
        data_source_secondary,
        CAST(data_source_type AS CHAR(30)) AS data_source_type,
        confidence_tier,
        CAST(quality_score AS DECIMAL(5,2)) AS quality_score,
        CAST(quality_grade AS CHAR(10)) AS quality_grade,
        CAST(review_flag AS CHAR(30)) AS review_flag,
        notes,
        created_at,
        updated_at
    FROM {{ source("raw", "raw_incidents_master") }}
)

SELECT * FROM source