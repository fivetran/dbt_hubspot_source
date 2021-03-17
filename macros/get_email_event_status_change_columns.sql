{% macro get_email_event_status_change_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "bounced", "datatype": "boolean"},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "portal_subscription_status", "datatype": dbt_utils.type_string()},
    {"name": "requested_by", "datatype": dbt_utils.type_string()},
    {"name": "source", "datatype": dbt_utils.type_string()},
    {"name": "subscriptions", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
