{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled', 'hubspot_users_enabled'])) }}

select {{ dbt_utils.star(source('hubspot','users')) }}
from {{ var('users') }}