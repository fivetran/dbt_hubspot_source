{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_task_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__engagement_task_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__engagement_task_tmp')),
                staging_columns=get_engagement_task_columns()
            )
        }}
    from base

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
    from macro
    
)

select *
from fields


