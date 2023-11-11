{% macro add_property_labels(passthrough_var_name, ref_name, default_cols) %}

select {{ ref_name }}.*

{%- set col_list = var(passthrough_var_name) -%}

-- Create cols to join
{%- for col in col_list -%}
  {% if col.add_property_label or var('hubspot__enable_all_property_labels', false) %}
    {%- set col_alias = (col.alias | default(col.name)) %}
    , {{ col.name }}_option.property_option_label as {{ col_alias }}_label
  {% endif %}
{%- endfor %}

from {{ ref_name }}

{% for col in col_list -%}
  {% if col.add_property_label or var('hubspot__enable_all_property_labels', false) %}
    {# {%- set col_alias = (col.alias | default(col.name)).replace('property_', '') %} #}
    {%- set col_alias = (col.alias | default(col.name)) %}

left join 
  (select 
    property_option.property_option_value, 
    property_option.property_option_label
  from {{ ref('stg_hubspot__property_option') }} as property_option
  join {{ ref('stg_hubspot__property') }} as property
    on property_option.property_id = property._fivetran_id
  where property.property_name = '{{ col.name.replace('property_', '') }}'
  ) as {{ col.name }}_option

  on cast({{ ref_name }}.{{ col_alias }} as {{ dbt.type_string() }})
    = cast({{ col.name }}_option.property_option_value as {{ dbt.type_string() }})

  {% endif %}
{%- endfor %}

{% endmacro %}