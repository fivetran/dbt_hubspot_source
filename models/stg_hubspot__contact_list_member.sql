with base as (

    select *
    from {{ source('hubspot','contact_list_member')}}

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        added_at as added_timestamp,
        contact_id,
        contact_list_id
    from base
    
)

select *
from fields