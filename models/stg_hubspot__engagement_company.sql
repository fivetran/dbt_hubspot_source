{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_company_enabled'])) }}

with base as (

    select *
    from {{ var('engagement_company')}}

), fields as (

    select
        _fivetran_synced,
        company_id,
        engagement_id
    from base
    
)

select *
from fields