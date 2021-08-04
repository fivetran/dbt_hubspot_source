{% macro get_contact_merge_audit_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "canonical_vid", "datatype": dbt_utils.type_int()},
    {"name": "contact_id", "datatype": dbt_utils.type_int()},
    {"name": "entity_id", "datatype": dbt_utils.type_string()},
    {"name": "first_name", "datatype": dbt_utils.type_string()},
    {"name": "last_name", "datatype": dbt_utils.type_string()},
    {"name": "num_properties_moved", "datatype": dbt_utils.type_int()},
    {"name": "timestamp", "datatype": dbt_utils.type_timestamp()},
    {"name": "user_id", "datatype": dbt_utils.type_int()},
    {"name": "vid_to_merge", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}