{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_delivered_enabled'])) }}

with base as (

    select *
    from {{ var('email_event_delivered')}}

), fields as (

    select
        _fivetran_synced,
        id as event_id,
        response as returned_response,
        smtp_id
    from base
    
)

select *
from fields