
{{ config(enabled=enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_bounce_enabled'])) }}

with base as (

    select *
    from {{ var('email_event_bounce')}}

), fields as (

    select
        _fivetran_synced,
        category as bounce_category,
        id as event_id,
        response as returned_response,
        status as returned_status
    from base
    
)

select *
from fields