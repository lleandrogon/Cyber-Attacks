WITH intermediate AS (
    SELECT * FROM {{ ref("int_incidents_master") }}
)

SELECT
    *,
    DENSE_RANK() OVER (ORDER BY data_compromised_records DESC) AS rank_largest_breaches
FROM intermediate
ORDER BY data_compromised_records DESC