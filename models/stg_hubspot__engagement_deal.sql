{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_deal_enabled'])) }}

with base as (

    select *
    from {{ var('engagement_deal')}}

), fields as (

    select
        _fivetran_synced,
        deal_id,
        engagement_id
    from base
    
)

select *
from fields
