{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_dropped_enabled'])) }}

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
        {% if target.type == 'snowflake' %}
        "FROM" as from_email,
        {% else %}
        "from" as from_email,
        {% endif %}
        id as event_id,
        reply_to as reply_to_email,
        subject as email_subject
    from base
    
)

select *
from fields