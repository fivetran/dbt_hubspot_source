with base as (

    select *
    from {{ source('hubspot','email_event_click')}}

), fields as (

    select
        _fivetran_synced,
        browser,
        id as event_id,
        ip_address,
        location as geo_location,
        referer as referer_url,
        url as click_url,
        user_agent
    from base
    
)

select *
from fields