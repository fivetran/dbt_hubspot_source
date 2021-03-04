{% macro get_email_event_delivered_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "response", "datatype": dbt_utils.type_string()},
    {"name": "smtp_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
