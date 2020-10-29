{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_company_enabled'])) }}

{%- set columns = adapter.get_columns_in_relation(ref('stg_hubspot__company_adapter')) -%}

with base as (

    select *
    from {{ ref('stg_hubspot__company_adapter') }}
    where is_deleted = False

), fields as (

    select
        id as company_id, 
        {{ remove_prefix_from_columns(columns=columns, exclude=['id']) }}
    from base

)

select *
from fields