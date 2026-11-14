select
    part_key,
    product_name,
    brand,
    manufacturer,
    product_type
from {{ ref('stg_products') }}
