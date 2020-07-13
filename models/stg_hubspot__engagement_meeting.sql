{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_email_enabled'])) }}

with base as (

    select *
    from {{ var('engagement_meeting')}}

), fields as (

    select
        _fivetran_synced,
        body as meeting_notes,
        created_from_link_id,
        end_time as end_timestamp,
        engagement_id,
        external_url,
        meeting_outcome,
        pre_meeting_prospect_reminders,
        source,
        source_id,
        start_time as start_timestamp,
        title as meeting_title,
        web_conference_meeting_id
    from base
    
)

select *
from fields