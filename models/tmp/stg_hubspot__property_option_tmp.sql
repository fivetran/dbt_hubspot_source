{{ config(enabled=var('hubspot_property_enabled', True)) }}

{{
    fivetran_utils.union_data(
        table_identifier='property_option', 
        database_variable='hubspot_database', 
        schema_variable='hubspot_schema', 
        default_database=target.database,
        default_schema='hubspot',
        default_variable='property_option',
        union_schema_variable='hubspot_union_schemas',
        union_database_variable='hubspot_union_databases'
    )
}}