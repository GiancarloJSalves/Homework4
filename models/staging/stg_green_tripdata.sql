SELECT 
    -- Identifiers
    CAST(vendorid AS int) AS vendor_id,
    CAST(ratecodeid AS int) AS rate_code_id,
    CAST(pulocationid AS int) AS pickup_location_id,
    CAST(dolocationid AS int) AS dropoff_location_id,
    -- timestamps
    CAST(lpep_pickup_datetime AS timestamps) AS pickup_datetime,
    CAST(lpep_dropoff_datetime AS timestamps) AS dropoff_datetime,
    -- trip info
    store_and_fwd_flag,
    CAST(passenger_count AS int),
    CAST(trip_distance AS float),
    CAST(trip_type AS int),
    -- payment info
    CAST(fare_amount AS numeric),
    CAST(extra AS numeric),
    CAST(mta_tax AS numeric),
    CAST(tip_amount AS numeric ),
    CAST(tolls_amount AS numeric),
    CAST(ehall_fee AS numeric),
    CAST(total_amount AS),
    CAST(payment_type AS numeric),
    CAST(congestion_surcharge AS numeric),
    CAST(improvement_surcharge AS numeric)
    
FROM {{source('raw_data', 'green_tripdata_ext')}}