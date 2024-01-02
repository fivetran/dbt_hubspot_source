{{ config(enabled=(var('hubspot_service_enabled', false) and var('hubspot_ticket_deal_enabled', false))) }}

{{
    fivetran_utils.union_data(
        table_identifier='ticket_deal', 
        database_variable='hubspot_database', 
        schema_variable='hubspot_schema', 
        default_database=target.database,
        default_schema='hubspot',
        default_variable='ticket_deal',
        union_schema_variable='hubspot_union_schemas',
        union_database_variable='hubspot_union_databases'
    )
}}