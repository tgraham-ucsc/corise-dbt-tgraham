We were approached by the marketing team to answer some questions about Greenery’s users! Use your staging models you created in Week 1 to answer their questions:

What is our user repeat rate?

Repeat Rate = Users who purchased 2 or more times / users who purchased

```with multiple_orders as (
    select count(distinct order_id),
        user_id
    from dbt_tgraham.base_orders
    group by 2
    having count(distinct order_id) > 1
),
total_orders as (
    select count(order_id)
    from dbt_tgraham.base_orders
)
select (
        
            select *
            from total_orders
        ) / (
            select count(*)
            from multiple_orders
        ) as repeat_rate

```

What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

###### Indicators for likely additional purchases
- high number of previous purchases
- high number of total page views
- recent visits
- time between last visit and last purchase
- high number of total lifetime orders
- high number of purchases with promos
- low number of returns
- top selling products

###### Indicators for non-likely future purchases
- low number of total lifetime purchases
- low number of total page views
- no recent visits
- item returned

###### Additional Data 
- product reviews / comments
- ??

NOTE: This is a hypothetical question vs. something we can analyze in our Greenery data set. Think about what exploratory analysis you would do to approach this question.

More stakeholders are coming to us for data, which is great! But we need to get some more models created before we can help. Create a marts folder, so we can organize our models, with the following subfolders for business units:

Core
Marketing
Product
Within each marts folder, create at least 1-2 intermediate models and 1-2 dimension/fact models.

Note: think about what metrics might be particularly useful for these business units, and build dbt models using greenery’s data

For example, some “core” datasets could include fact_orders, dim_products, and dim_users
The marketing mart could contain a model like “user_order_facts” which contains order information at the user level

The product mart could contain a model like “fact_page_views” which contains all page view events from greenery’s events data

Explain the marts models you added. Why did you organize the models in the way you did?

Use the dbt docs to visualize your model DAGs to ensure the model layers make sense

Paste in an image of your DAG from the docs



## Working Notes

### product_event_facts
Contains web traffic information at the product level.  This model uses the intermediate model int_product_events that parses out the product id from the page_url and pivots the event_type based on product_id.

### user_order_facts
Contains order information at the customer level. This model uses the dim_users model as well as stg_orders to build the final results.  Addtional values could be added such as average order ammount, time between orders, repeat_rate.

### dim_users
Contains information about the customer base, brings together information from stg_users and stg_addresses and keys off of user_id.

### fct_orders
Contains information about order information, who, what, when, how much, status, etc.  It is located in the core models folder as it can be reused for additional order bases analysis.

### needing work and clarification
- dim_products
- fct_events 

### Next steps
- build model that profiles user events and corelates them to orders
- work on tests 

