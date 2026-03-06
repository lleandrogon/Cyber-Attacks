WITH financial_impact AS (
    SELECT
        incident_id,
        direct_loss_usd,
        direct_loss_method,
        CASE
            WHEN ransom_demanded_usd > 0 
            THEN TRUE
            ELSE FALSE
        END AS has_ransom,
        ransom_demanded_usd,
        ransom_paid_usd,
        CASE
            WHEN ransom_demanded_usd > 0
            THEN ransom_paid_usd / ransom_demanded_usd
            ELSE NULL
        END AS ransom_paid_ratio,
        CASE
            WHEN ransom_demanded_usd > 0 AND ransom_source IS NULL
            THEN 'unknown'
            ELSE ransom_source
        END AS ransom_source,
        recovery_cost_usd,
        legal_fees_usd,
        regulatory_fine_usd,
        insurance_payout_usd,
        total_loss_usd,
        total_loss_method,
        total_loss_lower_bound,
        total_loss_upper_bound,
        inflation_adjusted_usd,
        cpi_index_used,
        NULLIF(TRIM(notes), '') AS notes,
        created_at,
        updated_at
    FROM {{ ref("stg_financial_impact") }}
)

SELECT * FROM financial_impact