{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__engagement_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__engagement_tmp')),
                staging_columns=get_engagement_columns()
            )
        }}
    from base

), fields as (

    select
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        active as is_active,
        activity_type,
        cast(created_at as {{ dbt.type_timestamp() }}) as created_timestamp,
        id as engagement_id,
        cast(last_updated as {{ dbt.type_timestamp() }}) as last_updated_timestamp,
        owner_id,
        portal_id,
        cast(occurred_timestamp as {{ dbt.type_timestamp() }}), -- source field name = timestamp ; alias declared in macros/get_engagement_columns.sql
        engagement_type
    from macro
    
)

select *
from fields


