{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with source as (

    select *
    from {{ var('ticket_pipeline_stage') }}

), fields as (

    select
        _fivetran_synced,
        archived as is_archived,
        display_order,
        id as ticket_pipeline_stage_id,
        label as pipeline_stage_label,
        pipeline_id as ticket_pipeline_id

    from source

)

select *
from fields
