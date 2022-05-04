{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled','hubspot_deal_contact_enabled'])) }}

select *
from {{ var('deal_contact') }}
