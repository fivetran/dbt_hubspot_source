{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with base as (

    select *
    from {{ var('ticket_property_history')}}

), fields as (

    select
        _fivetran_synced,
        ticket_id,
        name as field_name,
        source as change_source,
        source_id as change_source_id,
        timestamp_millis(timestamp) as change_timestamp, -- need to fix data type in fivetran
        value as new_value
    from base

)

select *
from fields
