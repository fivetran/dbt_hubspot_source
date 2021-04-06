{{ config(enabled=var('hubspot_service_enabled', False)) }}

with base as (

    select *
    from {{ ref('stg_hubspot__ticket_pipeline_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__ticket_pipeline_tmp')),
                staging_columns=get_ticket_pipeline_columns()
            )
        }}

    from base
),

final as (

    select
        cast(pipeline_id as {{ dbt_utils.type_int() }} ) as ticket_pipeline_id,
        _fivetran_deleted,
        _fivetran_synced,
        active as is_active,
        display_order,
        label as pipeline_label,
        object_type_id
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
