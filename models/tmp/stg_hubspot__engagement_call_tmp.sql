{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_call_enabled'])) }}

select *
from {{ var('engagement_call') }}
