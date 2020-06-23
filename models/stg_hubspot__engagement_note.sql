with base as (

    select *
    from {{ source('hubspot','engagement_note')}}

), fields as (

    select
        _fivetran_synced,
        body as note,
        engagement_id
    from base
    
)

select *
from fields