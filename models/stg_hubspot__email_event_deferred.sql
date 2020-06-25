with base as (

    select *
    from {{ var('email_event_deferred')}}

), fields as (

    select
        _fivetran_synced,
        attempt as attempt_number,
        id as event_id,
        response as returned_response
    from base
    
)

select *
from fields