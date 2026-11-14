# Semantic Views

Companion projects for building, publishing, and querying Snowflake Semantic Views, the warehouse-native semantic layer that defines governed metrics, dimensions, and relationships for SQL, BI tools, and Cortex Analyst.

| Folder | What it contains | Guide |
|---|---|---|
| [`dbt-ossie/`](dbt-ossie/) | End-to-end dbt project with staging views, star-schema fact and dimension tables, semantic layer metric and relationship definitions, and a deployment macro that compiles dbt semantic models through Apache Ossie into a governed Snowflake Semantic View over TPC-H sample order data | [Getting Started with dbt and Semantic Views using Apache Ossie](https://www.snowflake.com/en/developers/guides/getting-started-with-dbt-and-semantic-views-using-apache-ossie/) |

## License

Apache-2.0. See [LICENSE](LICENSE).
