
How many users do we have?

dbt=# select count(distinct user_id)
dbt-# from users;
 count 
-------
   130
(1 row)

dbt=# 