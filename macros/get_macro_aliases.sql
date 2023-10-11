{%- macro get_macro_aliases(get_column_macro, prefix='') -%}

    {%- set macro_column_aliases = [] -%}
    {%- for col in get_column_macro -%}
        {% if col.alias %}
            {%- set macro_column_aliases = macro_column_aliases.append((prefix ~ col.alias)| upper if target.type == 'snowflake' else prefix ~ col.alias) -%}
        {% endif %}
    {%- endfor -%}

{{ return(macro_column_aliases) }}
{%- endmacro -%}