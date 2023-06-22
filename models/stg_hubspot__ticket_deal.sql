{{ config(enabled=(var('hubspot_service_enabled', false) and var('hubspot_ticket_deal_enabled', false))) }}

with base as (

    select *
    from {{ ref('stg_hubspot__ticket_deal_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__ticket_deal_tmp')),
                staging_columns=get_ticket_deal_columns()
            )
        }}
        ,{{ 
            fivetran_utils.remove_prefix_from_columns(
                columns=adapter.get_columns_in_relation(ref('stg_hubspot__ticket_deal_tmp')), 
                prefix='property_hs_',exclude=get_macro_columns(get_ticket_deal_columns()))
        }}
    from base

)

select *
from macro
