# Snowflake Semantic View Examples

Companion code for Snowflake Semantic View tutorials and developer guides.

## Projects

| Folder | Guide | Description |
|---|---|---|
| [`dbt-ossie/`](dbt-ossie/) | *Getting Started with dbt and Semantic Views using Apache Ossie* | Build a star schema on `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1` with dbt (`dbt-core==1.12.6`, `dbt-snowflake==1.12.5`), compile semantic models into an Open Semantic Interchange (`target/osi_document.json`) document via Apache Ossie, and publish a native Snowflake Semantic View (`ANALYTICS.DEMO.sv_orders`) using `SYSTEM$CREATE_SEMANTIC_VIEW_FROM_OSSIE_YAML`. |

## Quick Start (`dbt-ossie`)

1. In Snowsight, create the target schema:
   ```sql
   CREATE DATABASE IF NOT EXISTS ANALYTICS;
   CREATE SCHEMA IF NOT EXISTS ANALYTICS.DEMO;
   ```

2. Clone this repository and install the pinned dbt packages:
   ```bash
   git clone https://github.com/sfc-gh-cnantasenamat/semantic-view.git
   cd semantic-view/dbt-ossie
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```

3. Export your Snowflake connection environment variables and run the build and publish steps:
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

4. Query the published semantic view in Snowsight:
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
