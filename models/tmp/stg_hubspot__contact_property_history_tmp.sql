{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_company_enabled'])) }}

select *
from {{ var('contact_property_history') }}
