{% macro get_engagement_call_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "engagement_id", "datatype": dbt.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
