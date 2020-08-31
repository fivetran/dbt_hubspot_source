{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with base as (

    select * 
    from {{ var('ticket_pipeline') }}

), fields as (

    select
        _fivetran_synced,
        id as ticket_pipeline_id,
        label as pipeline_label,
        archived as is_archived,
        display_order
    from base
    
)

select *
from fields