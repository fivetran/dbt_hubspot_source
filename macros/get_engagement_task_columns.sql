{% macro get_engagement_task_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "body", "datatype": dbt_utils.type_string()},
    {"name": "completion_date", "datatype": dbt_utils.type_string()},
    {"name": "engagement_id", "datatype": dbt_utils.type_int()},
    {"name": "for_object_type", "datatype": dbt_utils.type_string()},
    {"name": "is_all_day", "datatype": "boolean"},
    {"name": "priority", "datatype": dbt_utils.type_string()},
    {"name": "probability_to_complete", "datatype": dbt_utils.type_float()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "subject", "datatype": dbt_utils.type_string()},
    {"name": "task_type", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
