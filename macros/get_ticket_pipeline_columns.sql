{% macro get_ticket_pipeline_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "active", "datatype": "boolean"},
    {"name": "display_order", "datatype": dbt_utils.type_int()},
    {"name": "label", "datatype": dbt_utils.type_string()},
    {"name": "object_type_id", "datatype": dbt_utils.type_string()},
    {"name": "pipeline_id", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
