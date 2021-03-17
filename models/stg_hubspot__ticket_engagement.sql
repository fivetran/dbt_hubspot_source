{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled','hubspot_engagement_enabled'])) }}

with base as (

    select *
    from {{ var('ticket_engagement') }}

), fields as (

    select
        _fivetran_synced,
        ticket_id,
        engagement_id

    from base

)

select *
from fields
