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
 
As a reminder, our FINAL project :sob: is due by EOD on Sunday in this channel. Finish :muscle:!
For additional help:
If you missed it here is a recording of morning project session yesterday with discussion of question 1 on funnel analysis which is the majority of the project this week.
We also have office hours at 9am PT today (zoom) and Saturday 5pm (zoom)
 
Instructions below....
1. Post the link to your github repo in this channel #projects Add a readme file in your repo for short-answer questions
2. tag your code review partners (we will reveal pairings later today in your pod channel)
3. answer the following self assessment questions
Self review questions
Were you able to answer the product funnel questions? Y/N
Were you able to create an exposure on your product analytics model? Y/N
What was most challenging/surprising in completing this week’s project?
Is there anywhere you are still stuck or confused? Or Is there a particular part of the project where you want focused feedback from your reviewers?
Add your answer to “Reflection question” 2A if answering…. (if answering 2B instead, mark N/A)
What are you most proud of across the 4 weeks?
 
When your partners post their projects, please review it by answering the following questions via a threaded reply on their Slack post (due EOD Monday)
What are 1 or 2 things they did well in the project? I.e. names and descriptions were clear, addressed misspelled column in staging
What are 1 or 2 concrete ways they could improve their work?
If they indicated that they were stuck and/or want focused feedback please provide responses if you can...
Any additional thoughts? Feel free to add words of encouragement as well! 

