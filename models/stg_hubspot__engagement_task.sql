{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_task_enabled'])) }}

with base as (

    select *
    from {{ var('engagement_task')}}

), fields as (

    select
        _fivetran_synced,
        body as task_note,
        completion_date as completion_timestamp,
        engagement_id,
        for_object_type,
        is_all_day,
        priority,
        probability_to_complete,
        status as task_status,
        subject as task_subject,
        task_type
    from base
    
)

select *
from fields