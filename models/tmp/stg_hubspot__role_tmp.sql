{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled', 'hubspot_role_enabled'])) }}

select {{ dbt_utils.star(source('hubspot','role')) }}
from {{ var('role') }}