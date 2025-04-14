{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled']) and var('hubspot_engagement_communication_enabled', false)) }}

select {{ dbt_utils.star(source('hubspot','engagement_communication')) }}
from {{ var('engagement_communication') }}
