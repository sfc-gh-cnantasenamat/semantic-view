select
    customer_key,
    customer_name,
    market_segment,
    nation
from {{ ref('stg_customers') }}
