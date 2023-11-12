{% macro add_property_labels(passthrough_var_name, ref_name, default_cols) %}

select {{ ref_name }}.*

{%- if var(passthrough_var_name, []) != [] -%}
  {%- set col_list = var(passthrough_var_name) -%}

  {%- for col in col_list -%} -- Create label cols
    {%- if col.add_property_label or var('hubspot__enable_all_property_labels', false) -%}
      {%- set col_alias = (col.alias | default(col.name)) %}
      , {{ col.name }}_option.property_option_label as {{ col_alias }}_label
    {% endif -%}
  {%- endfor %}

  from {{ ref_name }}

  {% for col in col_list -%} -- Create joins
    {%- if col.add_property_label or var('hubspot__enable_all_property_labels', false) -%}
      {%- set col_alias = (col.alias | default(col.name)) %}

  left join -- create subset of property and property_options for property in question
    (select 
      property_option.property_option_value, 
      property_option.property_option_label
    from {{ ref('stg_hubspot__property_option') }} as property_option
    join {{ ref('stg_hubspot__property') }} as property
      on property_option.property_id = property._fivetran_id
      and property_option.property_option_label = property.property_label
    where property.property_name = '{{ col.name.replace('property_', '') }}'
    ) as {{ col.name }}_option

    on cast({{ ref_name }}.{{ col_alias }} as {{ dbt.type_string() }})
      = cast({{ col.name }}_option.property_option_value as {{ dbt.type_string() }})

    {% endif -%}
  {%- endfor %}

{%- else -%}
  from {{ ref_name }}

{%- endif -%}
{% endmacro %}