{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__contact_tmp') }}
    where not coalesce(_fivetran_deleted, false) 

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__contact_tmp')),
                staging_columns=get_contact_columns()
            )
        }}
    from base

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        property_email as email,
        id as contact_id


        --The below macro adds the fields defined within your hubspot__contact_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('hubspot__contact_pass_through_columns') }}

    from macro
    
)

select *
from fields