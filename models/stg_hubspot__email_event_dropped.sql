with base as (

    select *
    from {{ var('email_event_dropped')}}

), fields as (

    select
        _fivetran_synced,
        bcc as bcc_emails,
        cc as cc_emails,
        drop_message,
        drop_reason,
        "from" as from_email,
        id as event_id,
        reply_to as reply_to_email,
        subject as email_subject
    from base
    
)

select *
from fields