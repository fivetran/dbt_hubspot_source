{% macro get_engagement_meeting_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "body", "datatype": dbt.type_string()},
    {"name": "created_from_link_id", "datatype": dbt.type_int()},
    {"name": "end_time", "datatype": dbt.type_timestamp()},
    {"name": "engagement_id", "datatype": dbt.type_int()},
    {"name": "external_url", "datatype": dbt.type_string()},
    {"name": "location", "datatype": dbt.type_string()},
    {"name": "meeting_outcome", "datatype": dbt.type_string()},
    {"name": "pre_meeting_prospect_reminders", "datatype": dbt.type_string()},
    {"name": "source", "datatype": dbt.type_string()},
    {"name": "source_id", "datatype": dbt.type_string()},
    {"name": "start_time", "datatype": dbt.type_timestamp()},
    {"name": "title", "datatype": dbt.type_string()},
    {"name": "web_conference_meeting_id", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
