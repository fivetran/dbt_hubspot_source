{{ config(enabled=enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled'])) }}

with base as (

    select *
    from {{ var('email_campaign')}}

), fields as (

    select
        _fivetran_synced,
        app_id,
        app_name,
        content_id,
        id as email_campaign_id,
        name as email_campaign_name,
        num_included,
        num_queued,
        sub_type as email_campaign_sub_type,
        subject as email_campaign_subject,
        type as email_campaign_type
    from base
    
)

select *
from fields