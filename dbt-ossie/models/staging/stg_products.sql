select
    p_partkey   as part_key,
    p_name      as product_name,
    p_brand     as brand,
    p_mfgr      as manufacturer,
    p_type      as product_type
from {{ source('tpch', 'part') }}
