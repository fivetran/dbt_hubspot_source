{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_open_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__email_event_open_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__email_event_open_tmp')),
                staging_columns=get_email_event_open_columns()
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
        browser,
        duration as duration_open,
        id as event_id,
        ip_address,
        location as geo_location,
        user_agent,
        source_relation
        
    from macro
    
)

select *
from fields


