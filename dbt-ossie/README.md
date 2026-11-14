# Getting Started with dbt and Semantic Views using Apache Ossie

Companion dbt project for the Snowflake Developer Guide *Getting Started with dbt and Semantic Views using Apache Ossie*.

This project builds a star schema over `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1` (`fct_order_items`, `dim_customers`, `dim_products`), defines a dbt semantic layer (`_semantic_models.yml`), compiles an Open Semantic Interchange document (`target/osi_document.json`) natively during `dbt build`, and publishes it to Snowflake as `ANALYTICS.DEMO.sv_orders` via `SYSTEM$CREATE_SEMANTIC_VIEW_FROM_OSSIE_YAML`.

## Layout

```text
dbt-ossie/
├── dbt_project.yml
├── profiles.yml
├── requirements.txt
├── macros/
│   └── publish_semantic_view.sql
└── models/
    ├── staging/
    │   ├── _sources.yml
    │   ├── stg_orders.sql
    │   ├── stg_lineitem.sql
    │   ├── stg_customers.sql
    │   └── stg_products.sql
    └── marts/
        ├── _models.yml
        ├── _semantic_models.yml
        ├── fct_order_items.sql
        ├── dim_customers.sql
        ├── dim_products.sql
        └── metricflow_time_spine.sql
```

## Run

1. Create `ANALYTICS.DEMO` in Snowsight:
   ```sql
   CREATE DATABASE IF NOT EXISTS ANALYTICS;
   CREATE SCHEMA IF NOT EXISTS ANALYTICS.DEMO;
   ```

2. Create a Python virtual environment and install dependencies:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```

3. Export your Snowflake connection variables and run `dbt build` + `publish_semantic_view`:
   ```bash
   export SNOWFLAKE_ACCOUNT="<orgname>-<accountname>"
   export SNOWFLAKE_USER="<your_username>"
   export SNOWFLAKE_ROLE="ACCOUNTADMIN"
   export SNOWFLAKE_WAREHOUSE="COMPUTE_WH"
   export SNOWFLAKE_DATABASE="ANALYTICS"
   export SNOWFLAKE_SCHEMA="DEMO"

   dbt build --profiles-dir .
   dbt run-operation publish_semantic_view --args '{view_name: sv_orders}' --profiles-dir .
   ```

4. Query `ANALYTICS.DEMO.sv_orders`:
   ```sql
   SELECT *
   FROM SEMANTIC_VIEW(
       ANALYTICS.DEMO.sv_orders
       METRICS total_revenue, revenue_per_item, products_sold
       DIMENSIONS brand
   )
   ORDER BY total_revenue DESC
   LIMIT 5;
   ```
