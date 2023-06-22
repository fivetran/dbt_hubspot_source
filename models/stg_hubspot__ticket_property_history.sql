{{ config(enabled=var('hubspot_service_enabled', False)) }}

with base as (

    select *
    from {{ ref('stg_hubspot__ticket_property_history_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__ticket_property_history_tmp')),
                staging_columns=get_ticket_property_history_columns()
            )
        }}
        {% if fivetran_utils.remove_prefix_from_columns(columns=adapter.get_columns_in_relation(ref('stg_hubspot__ticket_property_history_tmp')), prefix='property_hs_',exclude=get_macro_columns(get_ticket_property_history_columns())) | length > 0 %},{% endif %}
        {{ 
            fivetran_utils.remove_prefix_from_columns(
                columns=adapter.get_columns_in_relation(ref('stg_hubspot__ticket_property_history_tmp')), 
                prefix='property_hs_',exclude=get_macro_columns(get_ticket_property_history_columns()))
        }} 
        from base

)

select *
from macro
