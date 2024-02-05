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

        {{ 
            fivetran_utils.source_relation(
                union_schema_variable='hubspot_union_schemas', 
                union_database_variable='hubspot_union_databases'
            ) 
        }}

    from base
),

final as (

    select
        cast(pipeline_id as {{ dbt.type_int() }} ) as ticket_pipeline_id,
        _fivetran_deleted as is_ticket_pipeline_deleted,
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        active as is_active,
        display_order,
        label as pipeline_label,
        object_type_id,
        created_at as ticket_pipeline_created_at,
        updated_at as ticket_pipeline_updated_at,
        source_relation
    from fields
)

select *
from final
