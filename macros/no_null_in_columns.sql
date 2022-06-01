{% macro no_null_in_columns(model) %}
{{ model }} WHERE 
{% for col in adapter.get_columns_in_relation(model)-%}
    {{col.name}} IS NULL
    {%- if not loop.last%}
          OR
    {%- endif %}
{% endfor %}

{% endmacro %}