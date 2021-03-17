{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_email_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__engagement_email_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__engagement_email_tmp')),
                staging_columns=get_engagement_email_columns()
            )
        }}
    from base

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
    from macro
    
)

select *
from fields


