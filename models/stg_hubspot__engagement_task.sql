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

/*
Some users have experienced the `completion_date` field being synced as a string rather than a timestamp.
To address this, we use the below run_query command to query a sinlge record from the engagement_task tmp table
and then assess in a conditional within the fields cte if the engagement_task field is indeed a UTC timestamp or not.

If the field is not a timestamp, then we safe_cast so downstream models do not fail. Otherwise, we do nothing to the 
field.
*/
{% if execute -%}
    {% set results = run_query('select completion_date from ' ~ ref('stg_hubspot__engagement_task_tmp') ~ ' where completion_date is not null limit 1') %}
    {% set results_list = results.columns[0].values() | string %}
{% endif -%}

), fields as (

    select
        _fivetran_synced,
        body as task_note,

        {% if 'tzinfo=<UTC>' not in results_list %}
            {{ dbt_utils.safe_cast('completion_date', 'timestamp') }} as completion_timestamp,
        {% else %}
            completion_date as completion_timestamp,
        {% endif %}

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
