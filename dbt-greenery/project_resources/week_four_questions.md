## Product Funnel


### Total Sessions
``` 
select count(distinct session_id)
from dbt_tgraham.fct_events;

 count 
-------
  1108


```

### Total Sessions with Page Views

```
select count(distinct session_id)
from dbt_tgraham.fct_events
where event_type ='page_view';

 count 
-------
   528

```

### Total Sessions with Add to Carts

```
select count(distinct session_id)
from dbt_tgraham.fct_events
where event_type ='add_to_cart';

 count 
-------
   480

```

### Sessions with Transactions

```
dbt=# select count(distinct session_id)
from dbt_tgraham.fct_events
where event_type ='checkout';

 count 
-------
   400

```
 
