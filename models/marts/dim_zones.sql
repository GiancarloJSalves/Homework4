with taxi_zone_lookup AS (
    SELECT * FROM {{ ref("taxi_zone_lookup")}}
),

renamed AS (select
    locationid as location_id,
    borough,
    zone,
    service_zone
from {{ ref('taxi_zone_lookup') }} )

SELECT * FROM renamed 