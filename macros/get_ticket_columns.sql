{% macro get_ticket_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "property_closed_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_createdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_first_agent_reply_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_pipeline", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_pipeline_stage", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_ticket_category", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_ticket_priority", "datatype": dbt_utils.type_string()},
    {"name": "property_hubspot_owner_id", "datatype": dbt_utils.type_int()},
    {"name": "property_subject", "datatype": dbt_utils.type_string()},
    {"name": "property_content", "datatype": dbt_utils.type_string()}  
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('hubspot__ticket_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}