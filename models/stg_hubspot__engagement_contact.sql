{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_contact_enabled'])) }}

with base as (

    select *
    from {{ var('engagement_contact')}}

), fields as (

    select
        _fivetran_synced,
        contact_id,
        engagement_id
    from base
    
)

select *
from fields