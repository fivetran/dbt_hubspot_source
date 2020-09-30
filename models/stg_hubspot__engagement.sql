{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_engagement_enabled'])) }}

with source as (

    select *
    from {{ var('engagement')}}

), fields as (

    select
        _fivetran_synced,
        active as is_active,
        activity_type,
        created_at,
        id as engagement_id,
        last_updated_at,
        owner_id,
        portal_id,
        timestamp as occurred_at,
        type as engagement_type

    from source

)

select *
from fields
