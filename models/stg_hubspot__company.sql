{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_company_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__company_tmp') }}
    where not coalesce(is_deleted, false) 

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__company_tmp')),
                staging_columns=get_company_columns()
            )
        }}
    from base

), fields as (

    select
        id as company_id, 
        _fivetran_synced,
        property_name as company_name,
        property_description as description,
        property_createdate as created_at,
        property_industry as industry,
        property_address as street_address,
        property_address_2 as street_address_2,
        property_city as city,
        property_state as state,
        property_country as country,
        property_annualrevenue as company_annual_revenue
        
        --The below macro adds the fields defined within your hubspot__ticket_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('hubspot__company_pass_through_columns') }}
        
    from macro
    
)

select *
from fields