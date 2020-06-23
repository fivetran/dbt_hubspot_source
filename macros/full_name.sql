{% macro full_name(first_name, last_name) %}

trim({{ dbt_utils.concat([first_name, "' '", last_name])}}) as full_name

{% endmacro %}