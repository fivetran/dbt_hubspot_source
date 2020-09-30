{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with source as (

    select *
    from {{ var('ticket_pipeline') }}

), fields as (

    select
        _fivetran_synced,
        archived as is_archived,
        display_order,
        id as ticket_pipeline_id,
        label as pipeline_label

    from source

)

select *
from fields
