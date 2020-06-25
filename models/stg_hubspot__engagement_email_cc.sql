with base as (

    select *
    from {{ var('engagement_email_cc')}}

), fields as (

    select
        _fivetran_synced,
        email as email_address,
        engagement_id,
        first_name,
        last_name
    from base
    
)

select *
from fields