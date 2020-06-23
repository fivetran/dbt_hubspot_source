{%- set columns = adapter.get_columns_in_relation(source('hubspot','company')) -%}

with base as (

    select *
    from {{ source('hubspot','company') }}
    where is_deleted = False

), fields as (

    select
        id as company_id, 
        {{ remove_prefix_from_columns(columns=columns, exclude=['id']) }}
    from base

)

select *
from fields