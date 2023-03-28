{% macro get_contact_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "property_hs_calculated_merged_vids", "datatype": dbt.type_string()},
    {"name": "property_email", "datatype": dbt.type_string()},
    {"name": "property_company", "datatype": dbt.type_string()},
    {"name": "property_firstname", "datatype": dbt.type_string()},
    {"name": "property_lastname", "datatype": dbt.type_string()},
    {"name": "property_createdate", "datatype": dbt.type_timestamp()},
    {"name": "property_jobtitle", "datatype": dbt.type_string()},
    {"name": "property_annualrevenue", "datatype": dbt.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('hubspot__contact_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}
