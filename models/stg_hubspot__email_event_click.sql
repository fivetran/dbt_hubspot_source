{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_click_enabled'])) }}

with base as (

    select *
    from {{ var('email_event_click')}}

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