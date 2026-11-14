select
    c.c_custkey     as customer_key,
    c.c_name        as customer_name,
    c.c_mktsegment  as market_segment,
    n.n_name        as nation
from {{ source('tpch', 'customer') }} c
left join {{ source('tpch', 'nation') }} n
    on c.c_nationkey = n.n_nationkey
