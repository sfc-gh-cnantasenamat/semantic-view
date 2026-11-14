-- Order headers, trimmed to a recent slice so the demo stays small.
select
    o_orderkey      as order_key,
    o_custkey       as customer_key,
    o_orderdate     as order_date,
    o_orderstatus   as order_status,
    o_totalprice    as order_total_price
from {{ source('tpch', 'orders') }}
where o_orderdate >= date '1998-01-01'
