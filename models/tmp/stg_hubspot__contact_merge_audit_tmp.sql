{{ config(enabled=(var('hubspot_marketing_enabled', true) and var('hubspot_contact_merge_audit_enabled', target.type=='bigquery'))) }}

select *
from {{ var('contact_merge_audit') }}