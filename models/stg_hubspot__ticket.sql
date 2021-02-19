{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

with base as (

    select *
    from {{ var('ticket') }}
    where is_deleted = False

), fields as (

    select
        id as ticket_id,
        property_closed_date as closed_at,
        property_createdate as created_at,
        property_hubspot_owner_id as owner_id,
        property_hs_pipeline as ticket_pipeline_id,
        property_hs_pipeline_stage as ticket_pipeline_stage_id,
        {{
            fivetran_utils.remove_prefix_from_columns(
                columns=columns,
                prefix='property_',
                exclude=[
                    'id',
                    'property_closed_date',
                    'property_createdate',
                    'property_hubspot_owner_id',
                    'property_hs_pipeline',
                    'property_hs_pipeline_stage'
                ]
            )
        }}

    from base

)

select *
from fields
