{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_property_enabled', 'hubspot_contact_property_history_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__contact_property_history_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__contact_property_history_tmp')),
                staging_columns=get_contact_property_history_columns()
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
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        contact_id,
        name as field_name,
        source as change_source,
        source_id as change_source_id,
        cast(change_timestamp as {{ dbt.type_timestamp() }}) as change_timestamp, -- source field name = timestamp ; alias declared in macros/get_contact_property_history_columns.sql
        value as new_value,
        source_relation
        
    from macro
    
)

select *
from fields
