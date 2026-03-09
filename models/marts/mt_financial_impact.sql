WITH intermediate AS (
    SELECT * FROM {{ ref("int_financial_impact") }}
)

SELECT
    *,
    DENSE_RANK() OVER(ORDER BY total_loss_usd DESC) AS rank_total_loss
FROM intermediate
ORDER BY total_loss_usd DESC