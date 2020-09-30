{{ config(enabled=enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with source as (

    select *
    from {{ var('deal') }}
    where is_deleted = False

), fields as (

    select
        _fivetran_synced,
        deal_id,
        deal_pipeline_id as current_deal_pipeline_id,
        deal_pipeline_stage_id as current_deal_pipeline_stage_id,
        owner_id,
        portal_id,
        property_construction_type as construction_type,
        property_createdate as created_at,
        property_dealname as deal_name,
        property_dealtype as deal_type,
        property_energy_consultant as energy_consultant,
        property_hs_lastmodifieddate as last_modified_at,
        property_hubspot_team_id as team_id,
        property_mp_project_id as project_id,
        property_sales_development_representative as sales_development_rep

    from source

)

select *
from fields
