{% macro hubspot_add_pass_through_columns(base_columns, pass_through_var) %}

  {% if pass_through_var %}
    {% for column in pass_through_var %}
      {% set quoted_column_name = adapter.quote(column.name) %}
      {% if column.alias %}
        {% do base_columns.append({ "name": quoted_column_name, "alias": adapter.quote(column.alias) }) %}
      {% else %}
        {% do base_columns.append({ "name": quoted_column_name }) %}
      {% endif %}
    {% endfor %}
  {% endif %}

{% endmacro %}
