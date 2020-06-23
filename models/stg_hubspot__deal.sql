{%- set columns = adapter.get_columns_in_relation(source('hubspot','deal')) -%}

with base as (

    select *
    from {{ source('hubspot','deal') }}
    where is_deleted = False

), fields as (

    select
        {{ remove_prefix_from_columns(columns=columns) }}
    from base

)

select *
from fields