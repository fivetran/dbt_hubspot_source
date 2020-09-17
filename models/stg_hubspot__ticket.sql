{{ config(enabled=enabled_vars(['hubspot_service_enabled','hubspot_ticket_enabled'])) }}

{%- set columns = adapter.get_columns_in_relation(ref('stg_hubspot__ticket_adapter')) -%}

with base as (

    select *
    from {{ ref('stg_hubspot__ticket_adapter') }}
    where is_deleted = False
        and merge_id is null -- removing any tickets that have been merged into consolidated ticket

), fields as (

    select
        _fivetran_synced,
        cast(id as int64) as ticket_id,
        trim(subject) as subject,
        trim(hs_ticket_category) as hs_ticket_category,
        timestamp_millis(createdate) as createdate, -- need to fix data type in fivetran
        timestamp_millis(closed_date) as closed_date, -- need to fix data type in fivetran
        timestamp_millis(first_agent_reply_date) as first_agent_reply_date, -- need to fix data type in fivetran
        {{ hubspot_source.remove_prefix_from_columns(columns=columns, exclude=['_fivetran_synced','id','subject','hs_ticket_category','createdate','closed_date','first_agent_reply_date']) }}
    from base

)

select *
from fields
