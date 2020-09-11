{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with base as (

    select *
    from {{ var('ticket_pipeline_stage') }}

), fields as (

    select
        _fivetran_synced,
        cast(id as string) as ticket_pipeline_stage_id,
        label as pipeline_stage_label,
        archived as is_archived,
        display_order,
        cast(pipeline_id as string) as ticket_pipeline_id
    from base

)

select *
from fields
