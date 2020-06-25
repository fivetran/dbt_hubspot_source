with base as (

    select *
    from {{ var('engagement_contact')}}

), fields as (

    select
        _fivetran_synced,
        contact_id,
        engagement_id
    from base
    
)

select *
from fields