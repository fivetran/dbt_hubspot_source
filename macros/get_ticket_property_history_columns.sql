{% macro get_ticket_property_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "ticket_id", "datatype": dbt.type_int()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "source", "datatype": dbt.type_string()},
    {"name": "source_id", "datatype": dbt.type_string()},
    {"name": "timestamp_instant", "datatype": dbt.type_timestamp()},
    {"name": "value", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
