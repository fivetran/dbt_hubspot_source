with base as (

    select *
    from {{ var('engagement_note')}}

), fields as (

    select
        _fivetran_synced,
        body as note,
        engagement_id
    from base
    
)

select *
from fields