{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

{%- set columns = adapter.get_columns_in_relation(ref('stg_hubspot__deal_adapter')) -%}

with base as (

    select *
    from {{ ref('stg_hubspot__deal_adapter') }}
    where is_deleted = False

), fields as (

    select
        {{ remove_prefix_from_columns(columns=columns) }}
    from base

)

select *
from fields