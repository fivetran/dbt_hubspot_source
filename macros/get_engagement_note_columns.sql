{% macro get_engagement_note_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "body", "datatype": dbt.type_string()},
    {"name": "engagement_id", "datatype": dbt.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
