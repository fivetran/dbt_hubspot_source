{% macro remove_duplicate_and_prefix_from_columns(columns, prefix='', exclude=[]) %}
        
        {%- set duplicate_exclude = [] -%}
        {% for col in columns if col.name not in exclude %}
        {%- for dupe in columns if col.name[prefix|length:]|lower == dupe.name -%}
        {%- do duplicate_exclude.append(col.name) -%}
        {%- do duplicate_exclude.append(dupe.name) -%}
        , coalesce({{ col.name }}, {{dupe.name}}) as {{ col.name[prefix|length:] }}
        {%- endfor %}
        {%- if col.name not in duplicate_exclude -%}
        {% if col.name[:prefix|length]|lower == prefix %}
        , {{ col.name }} as {{ col.name[prefix|length:] }}
        {%- else %}
        , {{ col.name }}
        {%- endif -%}
        {%- endif -%}
        {% endfor %}

{% endmacro %}