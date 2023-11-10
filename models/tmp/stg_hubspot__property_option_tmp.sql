{{ config(enabled=var('hubspot_sales_enabled', True)) }}

select {{ dbt_utils.star(source('hubspot','property_option')) }}
from {{ var('property_option') }}
