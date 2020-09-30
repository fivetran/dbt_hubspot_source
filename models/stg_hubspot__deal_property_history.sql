{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with source as (

    select *
    from {{ var('deal_property_history')}}

), fields as (

    select
        _fivetran_synced,
        deal_id,
        name as field_name,
        source as change_source,
        source_id as change_source_id,
        timestamp as changed_at,
        value as new_value

    from source

)

select *
from fields
