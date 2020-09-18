{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with base as (

    select *
    from {{ var('deal_pipeline')}}
    where _fivetran_deleted = False

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        active as is_active,
        display_order,
        label as pipeline_label,
        pipeline_id as deal_pipeline_id
    from base

)

select *
from fields
