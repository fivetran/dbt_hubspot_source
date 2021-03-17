{% macro get_email_event_deferred_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "attempt", "datatype": dbt_utils.type_int()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "response", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
