{{ config(enabled=var('hubspot_service_enabled', True)) }}

select *
from {{ var('ticket_engagement') }}
