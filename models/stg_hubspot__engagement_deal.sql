{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_deal_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__engagement_deal_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__engagement_deal_tmp')),
                staging_columns=get_engagement_deal_columns()
            )
        }}
        ,{{ 
            fivetran_utils.remove_prefix_from_columns(
                columns=adapter.get_columns_in_relation(ref('stg_hubspot__engagement_deal_tmp')), 
                prefix='property_hs_',exclude=get_macro_columns(get_engagement_deal_columns()))
        }}
    from base

)

select *
from macro



