{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_property_enabled'])) }}

select *
from {{ var('contact_property_history') }}
