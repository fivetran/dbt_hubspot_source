{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_company_enabled'])) }}

select *
from {{ var('company') }}