{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_enabled'])) }}
{%- set columns = adapter.get_columns_in_relation(ref('stg_hubspot__contact_tmp')) -%}

with base as (

    select *
    from {{ ref('stg_hubspot__contact_tmp') }}
    where not coalesce(_fivetran_deleted, false) 

), fields as (

    select
        id as contact_id,
        {{ fivetran_utils.remove_prefix_from_columns(columns=columns, prefix='property_', exclude=['id', 'property_contact_id']) }}
    from base

)

select *
from fields