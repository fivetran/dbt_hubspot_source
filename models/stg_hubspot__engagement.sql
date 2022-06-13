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
        _fivetran_synced,
        active as is_active,
        activity_type,
        created_at as created_timestamp,
        id as engagement_id,
        last_updated as last_updated_timestamp,
        owner_id,
        portal_id,
        occurred_timestamp, -- source field name = timestamp ; alias declared in macros/get_engagement_columns.sql
        engagement_type
    from macro
    
)

select *
from fields


