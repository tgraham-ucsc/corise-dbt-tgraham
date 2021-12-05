-- Add a post hook to your project to apply grants to the role “reporting”. Create reporting role first by running "CREATE ROLE reporting" in your database instance.
-- NOTE:: After you create the role you still need to grant it usage access on your schema dbt_firstname_lastname which can be done using on-run-end
-- HINT: you can use the grant macro example from this week and make any necessary changes for postgres syntax


{% macro grant_privs(role) %}

    {% set sql %}
    
      grant usage on schema {{ schema }} to {{ role }};
      grant select on all tables in schema {{ schema }} to {{ role }};
      
    {% endset %}

    {% set table = run_query(sql) %}

{% endmacro %}

