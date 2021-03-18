{{ config(enabled=var('hubspot_service_enabled', False)) }}

{%- set columns = adapter.get_columns_in_relation(ref('stg_hubspot__ticket_tmp')) -%}

with base as (

    select *
    from {{ var('ticket') }}
    where is_deleted = False

), fields as (

    select
        id as ticket_id,
        {{ fivetran_utils.remove_prefix_from_columns(columns=columns, prefix='property_', exclude=['id']) }}

    from base

)

select *
from fields
