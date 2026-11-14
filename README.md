# Semantic Views

Companion projects for building, publishing, and querying Snowflake Semantic Views, the warehouse-native semantic layer that defines governed metrics, dimensions, and relationships for SQL, BI tools, and Cortex Analyst.

| Folder | What it contains | Guide |
|---|---|---|
| [`dbt-ossie/`](dbt-ossie/) | dbt project with staging views, star-schema fact and dimension models (`fct_order_items`, `dim_customers`, `dim_products`), a MetricFlow time spine, a dbt semantic layer specification (`_semantic_models.yml`), and a custom macro (`publish_semantic_view`) that stages the Apache Ossie Open Semantic Interchange document (`target/osi_document.json`) and deploys it as a Snowflake Semantic View over TPC-H sample data | [Getting Started with dbt and Semantic Views using Apache Ossie](https://www.snowflake.com/en/developers/guides/getting-started-with-dbt-and-semantic-views-using-apache-ossie/) |

## License

Apache-2.0. See [LICENSE](LICENSE).
