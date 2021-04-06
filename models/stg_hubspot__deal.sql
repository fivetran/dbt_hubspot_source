{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__deal_tmp') }}
    where not coalesce(is_deleted, false)

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__deal_tmp')),
                staging_columns=get_deal_columns()
            )
        }}
    from base

), fields as (

    select
        _fivetran_synced,
        deal_id,
        deal_pipeline_id,
        deal_pipeline_stage_id,
        owner_id,
        portal_id,
        property_dealname as deal_name,
        property_description as description,
        property_amount as amount,
        property_closedate as closed_at,
        property_createdate as created_at

        --The below macro adds the fields defined within your hubspot__deal_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('hubspot__deal_pass_through_columns') }}

    from macro

)

select *
from fields
