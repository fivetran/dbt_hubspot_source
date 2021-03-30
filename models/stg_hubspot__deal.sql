{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__deal_tmp') }}
    where not coalesce(is_deleted, false) 

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__deal_tmp')),
                staging_columns=get_deal_columns()
            )
        }}
    from base

), fields as (

    select
        _fivetran_synced,
        deal_id,
        deal_pipeline_id,
        deal_pipeline_stage_id,
        is_deleted,
        owner_id,
        portal_id

        --The below script allows for pass through columns.
        {% if var('hubspot__deal_pass_through_columns') %}
            {% for field in var('hubspot__deal_pass_through_columns') %}
                , {{ field.alias if field.alias else field.name }}
            {% endfor %}
        {% endif %}
    from macro
    
)

select *
from fields