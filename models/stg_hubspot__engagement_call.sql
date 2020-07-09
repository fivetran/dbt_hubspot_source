{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_call_enabled'])) }}

with base as (

    select *
    from {{ var('engagement_call')}}

), fields as (

    select
        _fivetran_synced,
        body as call_notes,
        callee_object_id,
        callee_object_type,
        disposition as disposition_id,
        duration_milliseconds as call_duration_milliseconds,
        engagement_id,
        external_account_id,
        external_id,
        from_number,
        recording_url,
        status as call_status,
        to_number,
        transcription_id,
        unknown_visitor_conversation
    from base
    
)

select *
from fields