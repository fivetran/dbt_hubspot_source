{% macro get_deal_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "deal_id", "datatype": dbt_utils.type_int()},
    {"name": "deal_pipeline_id", "datatype": dbt_utils.type_string()},
    {"name": "deal_pipeline_stage_id", "datatype": dbt_utils.type_string()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "owner_id", "datatype": dbt_utils.type_int()},
    {"name": "portal_id", "datatype": dbt_utils.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('hubspot__deal_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}