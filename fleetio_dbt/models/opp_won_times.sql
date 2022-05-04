WITH calcs AS (
  SELECT
    ROUND(DATETIME_DIFF(opp_closed, opp_created,minute)/10080,0) AS opp_close_weeks
    -- ROUND(DATETIME_DIFF(lead_converted,lead_created, minute)/60,0) as lead_convert_hrs,
    , CASE WHEN is_won IS TRUE THEN 1 ELSE 0 END AS won_opps
    , CASE WHEN is_won IS FALSE THEN 1 ELSE 0 END AS lost_opps
    , *
  FROM {{ref('opportunity_data')}})
SELECT
  opp_close_weeks
  -- lead_convert_hrs,
  , SUM(won_opps) AS won_opps
  , SUM(lost_opps) AS lost_opps
  , SUM(won_opps)/SUM(lost_opps+won_opps) AS won_pct
FROM calcs
GROUP BY 1
ORDER BY 4 DESC