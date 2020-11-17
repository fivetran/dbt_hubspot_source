{% macro get_email_event_dropped_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "bcc", "datatype": dbt_utils.type_string()},
    {"name": "cc", "datatype": dbt_utils.type_string()},
    {"name": "drop_message", "datatype": dbt_utils.type_string()},
    {"name": "drop_reason", "datatype": dbt_utils.type_string()},
    {"name": "from", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "reply_to", "datatype": dbt_utils.type_string()},
    {"name": "subject", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
