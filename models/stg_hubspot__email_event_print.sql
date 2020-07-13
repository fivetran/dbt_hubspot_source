{{ config(enabled=enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_print_enabled'])) }}

with base as (

    select *
    from {{ var('email_event_print') }}

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