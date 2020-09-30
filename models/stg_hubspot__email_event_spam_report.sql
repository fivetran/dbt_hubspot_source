{{ config(enabled=enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_spam_report_enabled'])) }}

with source as (

    select *
    from {{ var('email_event_spam_report')}}

), fields as (

    select
        _fivetran_synced,
        id as event_id,
        ip_address,
        user_agent

    from source

)

select *
from fields
