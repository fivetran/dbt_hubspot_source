{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with base as (

    select *
    from {{ var('ticket_deal') }}

), fields as (

    select
        _fivetran_synced,
        ticket_id,
        array_agg(deal_id) as deal_id_array -- deal_id to array
    from base
    group by 1,2

)

select *
from fields
