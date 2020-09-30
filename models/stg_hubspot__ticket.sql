{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with source as (

    select *
    from {{ var('ticket') }}
    where is_deleted = False
        and merge_id is null -- removing any tickets that have been merged into consolidated ticket

), fields as (

    select
        _fivetran_synced,
        account_management_category,
        timestamp_millis(closed_date) as closed_at, -- need to fix data type in fivetran
        collections_blocked_category,
        content as ticket_content,
        timestamp_millis(createdate) as created_at, -- need to fix data type in fivetran
        timestamp_millis(first_agent_reply_date) as first_agent_reply_at, -- need to fix data type in fivetran
        hs_merged_object_ids as merged_object_ids,
        hs_object_id as object_id,
        hs_pipeline as current_ticket_pipeline_id,
        hs_pipeline_stage as current_ticket_pipeline_stage_id,
        trim(hs_ticket_category) as ticket_category,
        hs_ticket_priority as ticket_priority,
        hubspot_owner_id as owner_id,
        hubspot_team_id as team_id,
        cast(id as int64) as ticket_id,
        invoice_amount,
        invoice_type,
        invoicing_blocked_category,
        reason_for_contact,
        root_cause,
        service_category,
        trim(subject) as subject,
        support_category

    from source

)

select *
from fields
