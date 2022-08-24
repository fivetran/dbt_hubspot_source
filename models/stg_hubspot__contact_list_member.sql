{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_list_member_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__contact_list_member_tmp') }} 

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__contact_list_member_tmp')),
                staging_columns=get_contact_list_member_columns()
            )
        }}
    from base

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        added_at as added_timestamp,
        contact_id,
        contact_list_id
    from macro
    
)

select *
from fields
where not coalesce(_fivetran_deleted, false)
