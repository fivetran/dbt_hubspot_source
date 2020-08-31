with base as (

    select * 
    from {{ var('ticket_deal') }}

), fields as (

    select
        _fivetran_synced,
        ticket_id,
        deal_id
    from base
    
)

select *
from fields