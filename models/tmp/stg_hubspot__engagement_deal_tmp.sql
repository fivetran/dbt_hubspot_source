{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_deal_enabled'])) }}

select *
from {{ var('engagement_deal') }}
