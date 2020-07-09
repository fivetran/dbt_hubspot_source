{{ config(enabled=enabled_vars(['hubspot_marketing_enabled'])) }}

with base as (

    select *
    from {{ var('contact_list') }}
    where _fivetran_deleted is null

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        created_at as created_timestamp,
        deleteable as is_deletable,
        dynamic as is_dynamic,
        id as contact_list_id,
        metadata_error,
        metadata_last_processing_state_change_at,
        metadata_last_size_change_at,
        metadata_processing,
        metadata_size,
        name as contact_list_name,
        offset,
        portal_id,
        updated_at as updated_timestamp
    from base
    
)

select *
from fields