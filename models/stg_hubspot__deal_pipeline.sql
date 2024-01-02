{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__deal_pipeline_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__deal_pipeline_tmp')),
                staging_columns=get_deal_pipeline_columns()
            )
        }}
    
        {{ 
            fivetran_utils.source_relation(
                union_schema_variable='hubspot_union_schemas', 
                union_database_variable='hubspot_union_databases'
            ) 
        }}
        
    from base

), fields as (

    select
        _fivetran_deleted as is_deal_pipeline_deleted,
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        active as is_active,
        display_order,
        label as pipeline_label,
        cast(pipeline_id as {{ dbt.type_string() }}) as deal_pipeline_id,
        created_at as deal_pipeline_created_at,
        updated_at as deal_pipeline_updated_at,
        source_relation

    from macro
    
)

select *
from fields
