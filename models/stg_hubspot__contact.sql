with source as (

    select *
    from {{ var('contact') }}
    where _fivetran_deleted is null

), fields as (

    select
        _fivetran_synced,
        id as contact_id,
        property_address as address,
        property_associatedcompanyid as associated_company_id,
        property_city as city,
        property_country as country,
        property_county as county,
        property_createdate as created_at,
        property_email as email_address,
        property_firstname as first_name,
        property_lastmodifieddate as last_modified_at,
        property_lastname as last_name,
        property_lifecyclestage as lifecycle_stage,
        property_mp_account_id as marketplace_account_id,
        property_phone as phone_number,
        property_state as state,
        property_zip as zip_code,
        canonical_vid,
        {{ full_name('property_firstname','property_lastname') }}

    from source

)

select *
from fields
