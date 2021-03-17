{% macro get_contact_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "canonical_vid", "datatype": dbt_utils.type_int()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "merged_vids", "datatype": dbt_utils.type_string()},
    {"name": "profile_url", "datatype": dbt_utils.type_string()},
    {"name": "property_address", "datatype": dbt_utils.type_string()},
    {"name": "property_annualrevenue", "datatype": dbt_utils.type_string()},
    {"name": "property_associatedcompanyid", "datatype": dbt_utils.type_float()},
    {"name": "property_city", "datatype": dbt_utils.type_string()},
    {"name": "property_company", "datatype": dbt_utils.type_string()},
    {"name": "property_company_size", "datatype": dbt_utils.type_string()},
    {"name": "property_country", "datatype": dbt_utils.type_string()},
    {"name": "property_createdate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_currentlyinworkflow", "datatype": dbt_utils.type_string()},
    {"name": "property_date_of_birth", "datatype": dbt_utils.type_string()},
    {"name": "property_degree", "datatype": dbt_utils.type_string()},
    {"name": "property_email", "datatype": dbt_utils.type_string()},
    {"name": "property_engagements_last_meeting_booked", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_engagements_last_meeting_booked_campaign", "datatype": dbt_utils.type_string()},
    {"name": "property_engagements_last_meeting_booked_medium", "datatype": dbt_utils.type_string()},
    {"name": "property_engagements_last_meeting_booked_source", "datatype": dbt_utils.type_string()},
    {"name": "property_fax", "datatype": dbt_utils.type_string()},
    {"name": "property_field_of_study", "datatype": dbt_utils.type_string()},
    {"name": "property_first_deal_created_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_firstname", "datatype": dbt_utils.type_string()},
    {"name": "property_gender", "datatype": dbt_utils.type_string()},
    {"name": "property_graduation_date", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_all_accessible_team_ids", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_all_owner_ids", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_all_team_ids", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_average_page_views", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_analytics_first_referrer", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_first_timestamp", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_analytics_first_touch_converting_campaign", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_first_url", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_first_visit_timestamp", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_analytics_last_referrer", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_last_timestamp", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_analytics_last_touch_converting_campaign", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_last_url", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_last_visit_timestamp", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_analytics_num_event_completions", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_analytics_num_page_views", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_analytics_num_visits", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_analytics_revenue", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_analytics_source", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_source_data_1", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_analytics_source_data_2", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_avatar_filemanager_key", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_buying_role", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_content_membership_notes", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_content_membership_registration_domain_sent_to", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_content_membership_status", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_conversations_visitor_email", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_count_is_unworked", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_count_is_worked", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_created_by_conversations", "datatype": "boolean"},
    {"name": "property_hs_email_bad_address", "datatype": "boolean"},
    {"name": "property_hs_email_bounce", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_email_click", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_email_customer_quarantined_reason", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_email_delivered", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_email_first_click_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_email_first_open_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_email_first_send_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_email_hard_bounce_reason", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_email_hard_bounce_reason_enum", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_email_last_click_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_email_last_email_name", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_email_last_open_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_email_last_send_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_email_open", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_email_optout", "datatype": "boolean"},
    {"name": "property_hs_email_quarantined", "datatype": "boolean"},
    {"name": "property_hs_email_quarantined_reason", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_email_sends_since_last_engagement", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_emailconfirmationstatus", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_facebook_ad_clicked", "datatype": "boolean"},
    {"name": "property_hs_facebook_click_id", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_facebook_lead_id", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_facebookid", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_feedback_last_nps_follow_up", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_feedback_last_nps_rating", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_first_engagement_descr", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_first_engagement_object_id", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_first_engagement_object_type", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_first_engagement_type", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_google_click_id", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_googleplusid", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_ip_timezone", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_is_unworked", "datatype": "boolean"},
    {"name": "property_hs_language", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_last_sales_activity_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_last_sales_activity_timestamp", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_latest_meeting_activity", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_lead_status", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_legal_basis", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_lifecyclestage_lead_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_lifecyclestage_opportunity_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_lifecyclestage_subscriber_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_linkedinid", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_marketable_reason_id", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_marketable_reason_type", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_marketable_status", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_marketable_until_renewal", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_merged_object_ids", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_persona", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_predictivecontactscorebucket", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_predictivescoringtier", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_sa_first_engagement_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_sales_email_last_clicked", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_sales_email_last_opened", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_sales_email_last_replied", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hs_social_facebook_clicks", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_social_google_plus_clicks", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_social_linkedin_clicks", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_social_num_broadcast_clicks", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_social_twitter_clicks", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_time_to_first_engagement", "datatype": dbt_utils.type_float()},
    {"name": "property_hs_twitterid", "datatype": dbt_utils.type_string()},
    {"name": "property_hs_user_ids_of_all_owners", "datatype": dbt_utils.type_string()},
    {"name": "property_hubspot_owner_assigneddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_hubspot_owner_id", "datatype": dbt_utils.type_string()},
    {"name": "property_hubspot_team_id", "datatype": dbt_utils.type_string()},
    {"name": "property_industry", "datatype": dbt_utils.type_string()},
    {"name": "property_ip_city", "datatype": dbt_utils.type_string()},
    {"name": "property_ip_country", "datatype": dbt_utils.type_string()},
    {"name": "property_ip_country_code", "datatype": dbt_utils.type_string()},
    {"name": "property_ip_latlon", "datatype": dbt_utils.type_string()},
    {"name": "property_ip_state", "datatype": dbt_utils.type_string()},
    {"name": "property_ip_state_code", "datatype": dbt_utils.type_string()},
    {"name": "property_ip_zipcode", "datatype": dbt_utils.type_string()},
    {"name": "property_job_function", "datatype": dbt_utils.type_string()},
    {"name": "property_jobtitle", "datatype": dbt_utils.type_string()},
    {"name": "property_lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_lastname", "datatype": dbt_utils.type_string()},
    {"name": "property_lifecyclestage", "datatype": dbt_utils.type_string()},
    {"name": "property_linkedinbio", "datatype": dbt_utils.type_string()},
    {"name": "property_marital_status", "datatype": dbt_utils.type_string()},
    {"name": "property_message", "datatype": dbt_utils.type_string()},
    {"name": "property_military_status", "datatype": dbt_utils.type_string()},
    {"name": "property_mobilephone", "datatype": dbt_utils.type_string()},
    {"name": "property_notes_last_contacted", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_notes_last_updated", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_notes_next_activity_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "property_num_associated_deals", "datatype": dbt_utils.type_float()},
    {"name": "property_num_contacted_notes", "datatype": dbt_utils.type_float()},
    {"name": "property_num_notes", "datatype": dbt_utils.type_float()},
    {"name": "property_numemployees", "datatype": dbt_utils.type_string()},
    {"name": "property_owneremail", "datatype": dbt_utils.type_string()},
    {"name": "property_ownername", "datatype": dbt_utils.type_string()},
    {"name": "property_phone", "datatype": dbt_utils.type_string()},
    {"name": "property_phone_number_optional", "datatype": dbt_utils.type_string()},
    {"name": "property_relationship_status", "datatype": dbt_utils.type_string()},
    {"name": "property_salutation", "datatype": dbt_utils.type_string()},
    {"name": "property_school", "datatype": dbt_utils.type_string()},
    {"name": "property_seniority", "datatype": dbt_utils.type_string()},
    {"name": "property_start_date", "datatype": dbt_utils.type_string()},
    {"name": "property_state", "datatype": dbt_utils.type_string()},
    {"name": "property_twitterbio", "datatype": dbt_utils.type_string()},
    {"name": "property_twitterhandle", "datatype": dbt_utils.type_string()},
    {"name": "property_twitterprofilephoto", "datatype": dbt_utils.type_string()},
    {"name": "property_website", "datatype": dbt_utils.type_string()},
    {"name": "property_work_email", "datatype": dbt_utils.type_string()},
    {"name": "property_zip", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

