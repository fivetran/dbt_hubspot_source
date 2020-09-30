{{ config(enabled=enabled_vars(['hubspot_marketing_enabled'])) }}

with source as (

    select *
    from {{ var('contact_list') }}
    where _fivetran_deleted = False
      or _fivetran_deleted is null

), fields as (

    select
        _fivetran_synced,
        created_at,
        deletable as is_deletable,
        dynamic as is_dynamic,
        id as contact_list_id,
        metadata_error as error,
        metadata_last_processing_state_change_at as last_processing_stage_change_at,
        metadata_last_size_change_at as last_size_change_at,
        metadata_processing as processing_status,
        metadata_size as size,
        name,
        portal_id,
        updated_at

    from source

)

select *
from fields
