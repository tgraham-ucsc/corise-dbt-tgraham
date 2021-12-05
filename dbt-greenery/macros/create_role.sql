{% macro create_role(role) %}

 {% set create_role %}
          create role {{ role }};
  {% endset %}

  {% set role_test %}
      select count(*) from pg_catalog.pg_roles where rolname =  '{{ role }}' ;
  {% endset %}


  {% set table = run_query(create_role) %}



{% endmacro %}
