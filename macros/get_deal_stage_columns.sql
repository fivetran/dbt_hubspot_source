{% macro get_deal_stage_columns() %}

{% set columns = [
    {"name": "_fivetran_active", "datatype": "boolean"},
    {"name": "_fivetran_end", "datatype": dbt_utils.type_timestamp()},
    {"name": "_fivetran_start", "datatype": dbt_utils.type_timestamp()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_entered", "datatype": dbt_utils.type_timestamp()},
    {"name": "deal_id", "datatype": dbt_utils.type_int()},
    {"name": "source", "datatype": dbt_utils.type_string()},
    {"name": "source_id", "datatype": dbt_utils.type_string()},
    {"name": "value", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
