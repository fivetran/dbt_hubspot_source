{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_task_enabled'])) }}

with source as (

    select *
    from {{ var('engagement_task')}}

), fields as (

    select
        _fivetran_synced,
        body as task_note,
        timestamp_millis(completion_date) as closed_at, -- need to fix data type in fivetran
        engagement_id,
        for_object_type,
        is_all_day,
        priority,
        probability_to_complete,
        status as task_status,
        trim(subject) as task_subject,
        task_type

    from source

)

select *
from fields
