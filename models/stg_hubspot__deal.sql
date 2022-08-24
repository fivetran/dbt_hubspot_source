{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__deal_tmp') }}

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

{% if var('hubspot__pass_through_all_columns', false) %}
        -- just pass everything through
        {{ 
            fivetran_utils.remove_prefix_from_columns(
                columns=adapter.get_columns_in_relation(ref('stg_hubspot__deal_tmp')), 
                prefix='property_') 
        }}
    from base

{% else %}
        -- just default columns + explicitly configured passthrough columns
        _fivetran_synced,
        is_deleted,
        deal_id,
        cast(deal_pipeline_id as {{ dbt_utils.type_string() }}) as deal_pipeline_id,
        cast(deal_pipeline_stage_id as {{ dbt_utils.type_string() }}) as deal_pipeline_stage_id,
        owner_id,
        portal_id,
        property_dealname as deal_name,
        property_description as description,
        property_amount as amount,
        property_closedate as closed_at,
        property_createdate as created_at

        --The below macro adds the fields defined within your hubspot__deal_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('hubspot__deal_pass_through_columns') }}

        -- The below macro add the ability to create calculated fields using the hubspot__deal_calculated_fields variable.
        {{ fivetran_utils.calculated_fields('hubspot__deal_calculated_fields') }}

    from macro
{% endif %}

)

select *
from fields
where not coalesce(is_deleted, false)
