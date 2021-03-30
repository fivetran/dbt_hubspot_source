{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled', 'hubspot_contact_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__contact_tmp') }}
    where not coalesce(_fivetran_deleted, false) 

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__contact_tmp')),
                staging_columns=get_contact_columns()
            )
        }}
        --The below script allows for pass through columns.
        {% if var('hubspot__contact_pass_through_columns') %}
        ,
        {{ var('hubspot__contact_pass_through_columns') | join (", ")}}

        {% endif %}
    from base

), fields as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        id as contact_id

        --The below script allows for pass through columns.
        {% if var('hubspot__contact_pass_through_columns') %}
        ,
        {{ var('hubspot__contact_pass_through_columns') | join (", ")}}

        {% endif %}
    from macro
    
)

select *
from fields