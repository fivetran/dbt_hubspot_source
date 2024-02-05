
{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_bounce_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__email_event_bounce_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__email_event_bounce_tmp')),
                staging_columns=get_email_event_bounce_columns()
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
        category as bounce_category,
        id as event_id,
        response as returned_response,
        status as returned_status,
        source_relation
        
    from macro
    
)

select *
from fields


