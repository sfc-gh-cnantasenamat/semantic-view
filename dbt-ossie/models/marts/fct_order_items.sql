-- Fact table at order-item grain. Surrogate key is order_key + line_number,
-- which MetricFlow needs as a single primary entity column.
select
    o.order_key || '-' || l.line_number             as order_item_key,
    o.order_key,
    o.customer_key,
    l.part_key,
    o.order_date,
    o.order_status,
    l.quantity,
    l.extended_price,
    l.discount,
    l.extended_price * (1 - l.discount)             as net_revenue,
    l.extended_price * l.discount                   as discount_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_lineitem') }} l
    on o.order_key = l.order_key
