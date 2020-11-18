{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled'])) }}

select *
from {{ var('contact_list') }}
