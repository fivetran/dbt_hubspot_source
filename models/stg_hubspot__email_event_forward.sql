with base as (

    select *
    from {{ source('hubspot','email_event_forward')}}

), fields as (

    select
        _fivetran_synced,
        browser,
        id as event_id,
        ip_address,
        location as geo_location,
        user_agent
    from base
    
)

select *
from fields