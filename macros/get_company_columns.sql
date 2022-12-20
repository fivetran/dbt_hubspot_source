{% macro get_company_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "property_name", "datatype": dbt.type_string()},
    {"name": "property_description", "datatype": dbt.type_string()},
    {"name": "property_createdate", "datatype": dbt.type_timestamp()},
    {"name": "property_industry", "datatype": dbt.type_string()},
    {"name": "property_address", "datatype": dbt.type_string()},
    {"name": "property_address_2", "datatype": dbt.type_string()},
    {"name": "property_city", "datatype": dbt.type_string()},
    {"name": "property_state", "datatype": dbt.type_string()},
    {"name": "property_country", "datatype": dbt.type_string()},
    {"name": "property_annualrevenue", "datatype": dbt.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('hubspot__company_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}