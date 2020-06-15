with base as (

    select *
    from {{ source('hubspot','email_event_status_change')}}

), fields as (

    select
        _fivetran_synced,
        bounced as is_bounced,
        id as event_id,
        portal_subscription_status,
        requested_by as requested_by_email,
        source as change_source,
        subscriptions
    from base
    
)

select *
from fields