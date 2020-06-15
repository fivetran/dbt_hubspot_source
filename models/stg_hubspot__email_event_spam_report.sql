with base as (

    select *
    from {{ source('hubspot','email_event_spam_report')}}

), fields as (

    select
        _fivetran_synced,
        id as event_id,
        ip_address,
        user_agent
    from base
    
)

select *
from fields