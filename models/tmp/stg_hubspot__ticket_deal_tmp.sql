{{ config(enabled=(var('hubspot_service_enabled', false) and var('hubspot_ticket_deal_enabled', false))) }}

select *
from {{ var('ticket_deal') }}
