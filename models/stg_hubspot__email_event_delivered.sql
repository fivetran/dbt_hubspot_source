with base as (

    select *
    from {{ source('hubspot','email_event_delivered')}}

), fields as (

    select
        _fivetran_synced,
        id as event_id,
        response as returned_response,
        smtp_id
    from base
    
)

select *
from fields