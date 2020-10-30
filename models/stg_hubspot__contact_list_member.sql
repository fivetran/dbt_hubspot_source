{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled'])) }}

with base as (

    select *
    from {{ var('contact_list_member') }}
    where not coalesce(_fivetran_deleted, false) 

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        added_at as added_timestamp,
        contact_id,
        contact_list_id
    from base
    
)

select *
from fields