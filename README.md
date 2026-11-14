# Semantic Views

Companion projects for building, publishing, and querying Snowflake Semantic Views, the warehouse-native semantic layer that defines governed metrics, dimensions, and relationships for SQL, BI tools, and Cortex Analyst.

| Folder | What it contains | Guide |
|---|---|---|
| [`dbt-ossie/`](dbt-ossie/) | dbt project (`dbt-core==1.12.6`, `dbt-snowflake==1.12.5`) that builds a star schema on `SNOWFLAKE_SAMPLE_DATA.TPCH_SF1`, compiles semantic models into an Open Semantic Interchange (`target/osi_document.json`) document via Apache Ossie, and publishes a native Snowflake Semantic View (`ANALYTICS.DEMO.sv_orders`) | [Getting Started with dbt and Semantic Views using Apache Ossie](https://www.snowflake.com/en/developers/guides/getting-started-with-dbt-and-semantic-views-using-apache-ossie/) |

## License

Apache-2.0. See [LICENSE](LICENSE).
