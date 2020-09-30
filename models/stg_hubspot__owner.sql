{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_owner_enabled'])) }}

with source as (

    select *
    from {{ var('owner')}}

), fields as (

    select
        _fivetran_synced,
        created_at as created_at,
        email as email_address,
        first_name,
        last_name,
        owner_id,
        portal_id,
        type as owner_type,
        updated_at as updated_at,
        {{ full_name('first_name','last_name') }}

    from source

)

select *
from fields
