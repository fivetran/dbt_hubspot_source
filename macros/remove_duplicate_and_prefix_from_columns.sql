{% macro remove_duplicate_and_prefix_from_columns(columns, prefix='', exclude=[]) %}
        
        {# Loop once to find duplicates #}
        {%- set duplicate_exclude = [] -%}
        {% for col in columns if col.name not in exclude %}
        {%- for dupe in columns if col.name[prefix|length:]|lower == dupe.name|lower -%}
        {%- do duplicate_exclude.append(col.name) -%}
        {%- do duplicate_exclude.append(dupe.name) -%}
        , {{ col.name }} as {{ col.name[prefix|length:] }}
        {%- endfor %}
        {% endfor %}

        {# Loop again to find non-duplicates #}
        {% for col in columns if col.name not in exclude %}
        {%- if col.name|lower not in duplicate_exclude|lower -%}
        {% if col.name[:prefix|length]|lower == prefix %}
        , {{ col.name }} as {{ col.name[prefix|length:] }}
        {%- else %}
        , {{ col.name }}
        {%- endif -%}
        {%- endif -%}
        {% endfor %}

{% endmacro %}
