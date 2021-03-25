{% macro get_deal_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "deal_id", "datatype": dbt_utils.type_int()},
    {"name": "deal_pipeline_id", "datatype": dbt_utils.type_string()},
    {"name": "deal_pipeline_stage_id", "datatype": dbt_utils.type_string()},
    {"name": "is_deleted", "datatype": "boolean"},
    {"name": "owner_id", "datatype": dbt_utils.type_int()},
    {"name": "portal_id", "datatype": dbt_utils.type_int()},
    {"name": "property_amount", "datatype": dbt_utils.type_float()},
    {"name": "property_amount_in_home_currency", "datatype": dbt_utils.type_float()},
    {"name": "property_closed_lost_reason", "datatype": dbt_utils.type_string()},
    {"name": "property_closedate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_createdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_days_to_close", "datatype": dbt_utils.type_float()},
    {"name": "property_dealname", "datatype": dbt_utils.type_string()},
    {"name": "property_description", "datatype": dbt_utils.type_string()},
    {"name": "property_engagements_last_meeting_booked", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_analytics_source", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_source_data_1", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_source_data_2", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_closed_amount", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_closed_amount_in_home_currency", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_created_by_user_id", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_createdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_date_entered_closedlost", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_date_entered_presentationscheduled", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_date_entered_qualifiedtobuy", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_date_exited_presentationscheduled", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_date_exited_qualifiedtobuy", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_deal_stage_probability", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_is_closed", "datatype": "boolean"},
    {"name": "property_hs_lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_latest_meeting_activity", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_projected_amount", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_projected_amount_in_home_currency", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_sales_email_last_replied", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_time_in_closedlost", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_time_in_presentationscheduled", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_time_in_qualifiedtobuy", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_updated_by_user_id", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_user_ids_of_all_owners", "datatype": dbt_utils.type_string()},
    {"name": "property_hubspot_owner_assigneddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_notes_last_contacted", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_notes_last_updated", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_notes_next_activity_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_num_contacted_notes", "datatype": dbt_utils.type_float()},
    {"name": "property_num_notes", "datatype": dbt_utils.type_float()}
] %}

-- add pass through columns from project var
{{ add_pass_through_columns(columns, var('deal_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}
