{%- set columns = adapter.get_columns_in_relation(source('hubspot','contact')) -%}

with base as (

    select *
    from {{ source('hubspot','contact') }}
    where _fivetran_deleted is null

), fields as (

    select
        id as contact_id,
        {{ remove_prefix_from_columns(columns=columns, exclude=['id']) }}
    from base

)

select *
from fields