{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__deal_pipeline_stage_tmp') }}

), macro as (

    select 
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__deal_pipeline_stage_tmp')),
                staging_columns=get_deal_pipeline_stage_columns()
            )
        }}
    from base

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        active as is_active,
        closed_won as is_closed_won,
        display_order,
        label as pipeline_stage_label,
        pipeline_id as deal_pipeline_id,
        probability,
        cast(stage_id as {{ dbt_utils.type_string() }}) as deal_pipeline_stage_id
    from macro
    
)

select *
from fields
where not coalesce(_fivetran_deleted, false) 