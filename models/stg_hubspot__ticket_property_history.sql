{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with source as (

    select *
    from {{ var('ticket_property_history')}}

), fields as (

    select
        _fivetran_synced,
        name as field_name,
        source as change_source,
        source_id as change_source_id,
        ticket_id,
        timestamp_millis(timestamp) as changed_at, -- need to fix data type in fivetran
        value as new_value

    from source

)

select *
from fields
