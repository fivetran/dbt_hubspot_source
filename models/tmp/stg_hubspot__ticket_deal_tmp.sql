{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_service_enabled','hubspot_ticket_deal_enabled'])) }}

select *
from {{ var('ticket_deal') }}
