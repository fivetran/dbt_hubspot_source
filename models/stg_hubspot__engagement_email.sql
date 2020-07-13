{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_email_enabled'])) }}

with base as (

    select *
    from {{ var('engagement_email')}}

), fields as (

    select
        _fivetran_synced,
        attached_video_id,
        attached_video_opened as was_attached_video_opened,
        attached_video_watched as was_attached_video_watched,
        email_send_event_id_created as email_send_event_created_timestamp,
        email_send_event_id_id as email_send_event_id,
        engagement_id,
        error_message,
        facsimile_send_id,
        from_email,
        from_first_name,
        from_last_name,
        html as email_html,
        logged_from,
        media_processing_status,
        message_id,
        post_send_status,
        recipient_drop_reasons,
        sent_via,
        status as email_status,
        subject as email_subject,
        text as email_text,
        thread_id,
        tracker_key,
        validation_skipped
    from base
    
)

select *
from fields