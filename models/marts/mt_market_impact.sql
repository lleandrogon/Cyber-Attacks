WITH intermediate AS (
    SELECT * FROM {{ ref("int_market_impact") }}
)

SELECT
    *,
    DENSE_RANK() OVER (
        PARTITION BY sector_index
        ORDER BY abnormal_return_1d ASC 
    ) AS rank_worst_market_reaction_1d,

    DENSE_RANK() OVER (
        PARTITION BY sector_index
        ORDER BY abnormal_return_7d ASC 
    ) AS rank_worst_market_reaction_7d,

    DENSE_RANK() OVER (
        PARTITION BY sector_index
        ORDER BY abnormal_return_30d ASC 
    ) AS rank_worst_market_reaction_30d

FROM intermediate
ORDER BY abnormal_return_1d ASC
