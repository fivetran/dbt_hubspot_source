{{ config(enabled=var('hubspot_service_enabled', False)) }}

with base as (

    select *
    from {{ ref('stg_hubspot__ticket_tmp') }}
    where not coalesce(is_deleted, false) 

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__ticket_tmp')),
                staging_columns=get_ticket_columns()
            )
        }}
    from base

), fields as (

    select
        id as ticket_id,
        _fivetran_synced,
        is_deleted

        --The below macro adds the fields defined within your hubspot__ticket_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('hubspot__ticket_pass_through_columns') }}
        
    from macro
    
)

select *
from fields