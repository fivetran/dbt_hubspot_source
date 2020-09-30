with source as (

    select *
    from {{ var('contact_property_history') }}

), fields as (

    select
        _fivetran_synced,
        contact_id,
        name as field_name,
        source as change_source,
        source_id as change_source_id,
        timestamp as changed_at,
        value as new_value

    from source

)

select *
from fields
