
  SELECT
      CASE WHEN is_won is true THEN 1 else 0 END as won_count
    , CASE WHEN is_closed is true THEN 1 else 0 END as closed_count
    , o.created_at AS opp_created
    , o.closed_at AS opp_closed
    , o.is_closed
    , o.is_won
    , a.country
    , a.state
    , a.city
    , l.created_at AS lead_created
    , l.converted_at AS lead_converted
    , l.source
    , l.industry
    , l.fleet_size
    , l.job_title
  FROM fleetiodata.opportunities o
  LEFT JOIN fleetiodata.accounts a ON a.id = o.account_id
  LEFT JOIN fleetiodata.contacts c ON c.account_id = a.id
  LEFT JOIN fleetiodata.leads l ON l.id = c.lead_id 
  