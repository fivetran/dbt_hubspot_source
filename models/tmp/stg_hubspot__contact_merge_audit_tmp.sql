{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_merge_audit_enabled'])) }}

select *
from {{ var('contact_merge_audit') }}