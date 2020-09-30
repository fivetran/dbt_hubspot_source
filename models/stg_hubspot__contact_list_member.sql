{{ config(enabled=enabled_vars(['hubspot_marketing_enabled'])) }}

with source as (

    select *
    from {{ var('contact_list_member') }}
    where _fivetran_deleted = False
      or _fivetran_deleted is null

), fields as (

    select
        _fivetran_synced,
        contact_list_id,
        contact_id,
        added_at

    from source

)

select *
from fields
