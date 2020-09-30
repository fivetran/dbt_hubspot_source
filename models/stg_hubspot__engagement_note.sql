{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled','hubspot_engagement_note_enabled'])) }}

with source as (

    select *
    from {{ var('engagement_note')}}

), fields as (

    select
        _fivetran_synced,
        body as note,
        engagement_id

    from source

)

select *
from fields
