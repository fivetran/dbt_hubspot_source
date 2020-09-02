{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

{%- set columns = adapter.get_columns_in_relation(ref('stg_hubspot__ticket_adapter')) -%}

with base as (

    select * 
    from {{ ref('stg_hubspot__ticket_adapter') }}
    where is_deleted = False

), fields as (

    select
        _fivetran_synced,
        id as ticket_id,
        {{ hubspot_source.remove_prefix_from_columns(columns=columns, exclude=['_fivetran_synced','id']) }}
    from base

)

select *
from fields