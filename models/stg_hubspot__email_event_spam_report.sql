{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_spam_report_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__email_event_spam_report_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__email_event_spam_report_tmp')),
                staging_columns=get_email_event_spam_report_columns()
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
        id as event_id,
        ip_address,
        user_agent,
        source_relation
        
    from macro
    
)

select *
from fields


