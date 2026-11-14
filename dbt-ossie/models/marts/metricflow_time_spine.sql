-- MetricFlow requires a daily time spine to resolve time-based and
-- cumulative metrics. Generated with Snowflake's GENERATOR.
with days as (
    select
        dateadd(day, seq4(), date '1990-01-01') as date_day
    from table(generator(rowcount => 20000))
)
select date_day
from days
where date_day < date '2045-01-01'
