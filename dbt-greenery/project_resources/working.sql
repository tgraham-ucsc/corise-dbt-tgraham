
{% set query %}

  select * from dbt_tgraham.int_conv_rate_product}
  
{% endset %}


select get_result_set(query)

