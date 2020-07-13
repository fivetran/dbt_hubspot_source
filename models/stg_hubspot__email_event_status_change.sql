{{ config(enabled=enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_status_change_enabled'])) }}

with base as (

    select *
    from {{ var('email_event_status_change')}}

), fields as (

    select
        _fivetran_synced,
        bounced as is_bounced,
        id as event_id,
        portal_subscription_status as subscription_status,
        requested_by as requested_by_email,
        source as change_source,
        subscriptions
    from base
    
)

select *
from fields