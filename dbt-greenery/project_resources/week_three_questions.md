
## 1. Questions


### conversion rate

```
The conversion rate is the number of conversions divided by the total number of visitors. 
For example, if an ecommerce site receives 200 visitors in a month and has 50 sales, 
the conversion rate would be 50 divided by 200, or 25%.

```


### What is our overall conversion rate?

- models/product/intermediate/int_conv_rate.sql

11.9 


### What is our conversion rate by product?

- [models/product/intermediate/int_conv_rate_product.sql] (https://github.com/tgraham-ucsc/corise-dbt-tgraham/blob/main/dbt-greenery/models/marts/product/intermediate/int_conv_rate_product.sql)

```
 orders | page_views |    product_name     | conversion_rate 
--------+------------+---------------------+-----------------
     17 |         75 | Philodendron        |            22.7
     10 |         68 | Devil's Ivy         |            14.7
     18 |         62 | Monstera            |            29.0
     18 |         67 | Peace Lily          |            26.9
     11 |         66 | Alocasia Polly      |            16.7
     15 |         66 | Money Tree          |            22.7
     21 |         86 | Bamboo              |            24.4
     10 |         50 | Jade Plant          |            20.0
     20 |         80 | Dragon Tree         |            25.0
     16 |         70 | Boston Fern         |            22.9
     17 |         68 | Calathea Makoyana   |            25.0
     25 |         94 | String of pearls    |            26.6
     19 |         74 | Pink Anthurium      |            25.7
     22 |         75 | Majesty Palm        |            29.3
     16 |         69 | Pilea Peperomioides |            23.2
     15 |         76 | Aloe Vera           |            19.7
     13 |         60 | Pothos              |            21.7

```


### Create a macro to simplify part of a model(s)

Created the macro [get_result_set](../macros/get_result_set.sql) to it allows for the construction and iteration of a data set.
 Likely much better ways to do this, but I'm using it if [fct_events](../models/marts/core/fct_events.sql) to null out product_id if 
 there is not a corresponding product_id in the dim_products table.  And using it in [product_fact_events](../models/marts/product/product_fct_events.sql)
 to loop through event_types and group and aggregate accordingly.  Like I said, probably much better ways to do this ;)

###  









(3) We’re starting to think about granting permissions to our dbt models in our postgres database so that other roles can have access to them.

Add a post hook to your project to apply grants to the role “reporting”. Create reporting role first by running "CREATE ROLE reporting" in your database instance.
NOTE:: After you create the role you still need to grant it usage access on your schema dbt_firstname_lastname which can be done using on-run-end
HINT: you can use the grant macro example from this week and make any necessary changes for postgres syntax