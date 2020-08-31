with base as (

    select * 
    from {{ var('ticket_pipeline_stage') }}

), fields as (

    select
        _fivetran_synced,
        id as ticket_pipeline_stage_id,
        label as pipeline_stage_label,
        archived as is_archived,
        display_order,
        pipeline_id as ticket_pipeline_id
    from base

)

select *
from fields