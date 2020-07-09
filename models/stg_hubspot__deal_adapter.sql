{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

select *
from {{ var('deal') }}