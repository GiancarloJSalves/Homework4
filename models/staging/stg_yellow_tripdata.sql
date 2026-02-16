SELECT 
    -- Identifiers
    CAST(vendorid AS int) AS vendor_id,
    CAST(ratecodeid AS int) AS rate_code_id,
    CAST(pulocationid AS int) AS pickup_location_id,
    CAST(dolocationid AS int) AS dropoff_location_id,

    -- timestamps
    CAST(lpep_pickup_datetime AS TIMESTAMP) AS pickup_datetime,
    CAST(lpep_dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,

    -- trip info
    store_and_fwd_flag,
    CAST(passenger_count AS int) AS passenger_count,
    CAST(trip_distance AS float64) AS trip_distance,
    1 AS trip_type,

    -- payment info
    CAST(fare_amount AS numeric) AS fare_amount,
    CAST(extra AS numeric) AS extra,
    CAST(mta_tax AS numeric) AS mta_tax,
    CAST(tip_amount AS numeric) AS tip_amount,
    CAST(tolls_amount AS numeric) AS tolls_amount,
    0 AS ehail_fee,
    CAST(total_amount AS numeric) AS total_amount,
    CAST(payment_type AS numeric) AS payment_type,
    CAST(congestion_surcharge AS numeric) AS congestion_surcharge,
    CAST(improvement_surcharge AS numeric) AS improvement_surcharge

FROM {{ source('raw_data', 'green_tripdata_ext') }}
WHERE vendorid IS NOT NULL
