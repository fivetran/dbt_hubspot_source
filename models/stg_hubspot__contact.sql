{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__contact_tmp') }}

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
        id as contact_id,

{% if var('hubspot__pass_through_all_columns', false) %}
        -- just pass everything through
        {{ 
            fivetran_utils.remove_prefix_from_columns(
                columns=adapter.get_columns_in_relation(ref('stg_hubspot__contact_tmp')), 
                prefix='property_', exclude=['id', 'property_contact_id']) 
        }}
    from base

{% else %}
        -- just default columns + explicitly configured passthrough columns
        property_email as email,
        property_company as contact_company,
        property_firstname as first_name,
        property_lastname as last_name,
        property_createdate as created_at,
        property_jobtitle as job_title,
        property_annualrevenue as company_annual_revenue,
        _fivetran_deleted,
        _fivetran_synced

        --The below macro adds the fields defined within your hubspot__contact_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('hubspot__contact_pass_through_columns') }}

        -- The below macro add the ability to create calculated fields using the hubspot__contact_calculated_fields variable.
        {{ fivetran_utils.calculated_fields('hubspot__contact_calculated_fields') }}

    from macro
{% endif %}    
    
)

select *
from fields
where not coalesce(_fivetran_deleted, false) 