{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_owner_enabled'])) }}

with base as (

    select *
    from {{ var('owner')}}

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
    from base
    
)

select *
from fields