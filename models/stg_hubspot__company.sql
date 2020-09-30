{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_company_enabled'])) }}

with source as (

    select *
    from {{ var('company') }}
    where is_deleted = False

), fields as (

    select
        _fivetran_synced,
        id as company_id,
        portal_id,
        property_address as address_line_1,
        property_address_2 as address_line_2,
        property_city as city,
        poperty_country as country,
        property_createdate as created_at,
        property_description as description,
        property_facebook_company_page as facebook_url,
        property_hs_lastmodifieddate as last_modified_at,
        property_industry as industry,
        property_linkedin_company_page as linkedin_url,
        property_name as name,
        property_phone as phone_number,
        property_state as state,
        property_twitterhandle as twitter_handle,
        property_zip as zip_code,
        coalesce(property_website, property_domain) as url

    from source

)

select *
from fields
