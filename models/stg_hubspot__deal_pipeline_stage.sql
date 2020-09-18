{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with base as (

    select *
    from {{ var('deal_pipeline_stage')}}
    where _fivetran_deleted = False

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        active as is_active,
        closed_won as is_closed_won,
        display_order,
        label as deal_pipeline_stage_label,
        pipeline_id as deal_pipeline_id,
        probability,
        stage_id as deal_pipeline_stage_id
    from base

)

select *
from fields
