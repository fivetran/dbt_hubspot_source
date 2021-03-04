{% macro get_email_event_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "app_id", "datatype": dbt_utils.type_int()},
    {"name": "caused_by_created", "datatype": dbt_utils.type_timestamp()},
    {"name": "caused_by_id", "datatype": dbt_utils.type_string()},
    {"name": "created", "datatype": dbt_utils.type_timestamp()},
    {"name": "email_campaign_id", "datatype": dbt_utils.type_int()},
    {"name": "filtered_event", "datatype": "boolean"},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "obsoleted_by_created", "datatype": dbt_utils.type_timestamp()},
    {"name": "obsoleted_by_id", "datatype": dbt_utils.type_string()},
    {"name": "portal_id", "datatype": dbt_utils.type_int()},
    {"name": "recipient", "datatype": dbt_utils.type_string()},
    {"name": "sent_by_created", "datatype": dbt_utils.type_timestamp()},
    {"name": "sent_by_id", "datatype": dbt_utils.type_string()},
    {"name": "type", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
