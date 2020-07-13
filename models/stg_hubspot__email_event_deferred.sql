{{ config(enabled=enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_deferred_enabled'])) }}

with base as (

    select *
    from {{ var('email_event_deferred')}}

), fields as (

    select
        _fivetran_synced,
        attempt as attempt_number,
        id as event_id,
        response as returned_response
    from base
    
)

select *
from fields