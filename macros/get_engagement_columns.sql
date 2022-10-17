{% macro get_engagement_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "active", "datatype": "boolean"},
    {"name": "activity_type", "datatype": dbt.type_string()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "last_updated", "datatype": dbt.type_timestamp()},
    {"name": "owner_id", "datatype": dbt.type_int()},
    {"name": "portal_id", "datatype": dbt.type_int()},
    {"name": "timestamp", "datatype": dbt.type_timestamp(), "alias": "occurred_timestamp"},
    {"name": "type", "datatype": dbt.type_string(), "alias": "engagement_type"}
] %}

{{ return(columns) }}

{% endmacro %}
