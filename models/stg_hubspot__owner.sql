{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_owner_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__owner_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__owner_tmp')),
                staging_columns=get_owner_columns()
            )
        }}
    from base

), fields as (

    select
        _fivetran_synced,
        created_at as created_timestamp,
        email as email_address,
        first_name,
        last_name,
        owner_id,
        portal_id,
        type as owner_type,
        updated_at as updated_timestamp,
        trim( {{ dbt_utils.concat(['first_name', "' '", 'last_name']) }} ) as full_name
    from macro
    
)

select *
from fields


