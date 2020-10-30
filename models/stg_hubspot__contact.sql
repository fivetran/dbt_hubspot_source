{%- set columns = adapter.get_columns_in_relation(ref('stg_hubspot__contact_adapter')) -%}

with base as (

    select *
    from {{ ref('stg_hubspot__contact_adapter') }}
    where not coalesce(_fivetran_deleted, false) 

), fields as (

    select
        id as contact_id,
        {{ fivetran_utils.remove_prefix_from_columns(columns=columns, exclude=['id']) }}
    from base

)

select *
from fields