{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_contact_enabled'])) }}

{{
    fivetran_utils.union_data(
        table_identifier='engagement_contact', 
        database_variable='hubspot_database', 
        schema_variable='hubspot_schema', 
        default_database=target.database,
        default_schema='hubspot',
        default_variable='engagement_contact',
        union_schema_variable='hubspot_union_schemas',
        union_database_variable='hubspot_union_databases'
    )
}}