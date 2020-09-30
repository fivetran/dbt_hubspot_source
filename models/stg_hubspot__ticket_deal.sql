{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with source as (

    select *
    from {{ var('ticket_deal') }}

), fields as (

    select
        _fivetran_synced,
        deal_id
        ticket_id

    from source

)

select *
from fields
