with base as (

    select *
    from {{ var('owner')}}

), fields as (

    select
        _fivetran_synced,
        created_at as created_timestamp,
        email as email_address,
        first_name,
        last_name,
        owner_id,
        portal_id,
        type as owner_type,
        updated_at as updated_timestamp,
        {{ full_name('first_name','last_name') }}
    from base
    
)

select *
from fields