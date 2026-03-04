WITH source AS (
    SELECT
        incident_id,
        CAST(direct_loss_usd AS DECIMAL(18,2)) AS direct_loss_usd,
        CAST(direct_loss_method AS VARCHAR(30)) AS direct_loss_method,
        CAST(ransom_demanded_usd AS DECIMAL(18,2)) AS ransom_demanded_usd,
        CAST(ransom_paid_usd AS DECIMAL(18,2)) AS ransom_paid_usd,
        CAST(ransom_source AS VARCHAR (50)) AS ransom_source,
        CAST(recovery_cost_usd AS DECIMAL(18,2)) AS recovery_cost_usd,
        CAST(legal_fees_usd AS DECIMAL(18,2)) AS legal_fees_usd,
        CAST(regulatory_fine_usd AS DECIMAL(18,2)) AS regulatory_fine_usd,
        CAST(insurance_payout_usd AS DECIMAL(18,2)) AS insurance_payout_usd,
        CAST(total_loss_usd AS DECIMAL(18,2)) AS total_loss_usd,
        CAST(total_loss_method AS VARCHAR(30)) AS total_loss_method,
        CAST(total_loss_lower_bound AS DECIMAL(18,2)) AS total_loss_lower_bound,
        CAST(total_loss_upper_bound AS DECIMAL(18,2)) AS total_loss_upper_bound,
        CAST(inflation_adjusted_usd AS DECIMAL(18,2)) AS inflation_adjusted_usd,
        CAST(cpi_index_used AS VARCHAR(40)) AS cpi_index_used,
        notes,
        created_at,
        updated_at
    FROM {{ source("raw", "raw_financial_impact") }}
)

SELECT * FROM source