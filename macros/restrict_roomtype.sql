{% test restrict_roomtype(model,column_name) %}

SELECT * FROM {{model}} WHERE 
{{column_name}} NOT IN
('Entire home/apt','Private room','Cafeteria','Shared room','Hotel room')

{% endtest %}