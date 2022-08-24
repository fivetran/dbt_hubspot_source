{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_list_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__contact_list_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__contact_list_tmp')),
                staging_columns=get_contact_list_columns()
            )
        }}
    from base

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
        portal_id,
        updated_at as updated_timestamp
    from macro
    
)

select *
from fields
where not coalesce(_fivetran_deleted, false) 
