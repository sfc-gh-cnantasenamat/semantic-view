{#-
  Publish dbt's Ossie document (target/osi_document.json) as a Snowflake semantic view
  named view_name. Run after `dbt parse` or `dbt build`:
    dbt run-operation publish_semantic_view --args '{view_name: sv_orders}'
-#}
{% macro publish_semantic_view(view_name, doc_path='target/osi_document.json') %}
{% if execute %}
  {%- set schema = target.database ~ '.' ~ target.schema -%}
  {%- set stage = schema ~ '.ossie_publish' -%}
  {% do run_query("create temporary stage if not exists " ~ stage ~ " file_format = (type = json)") %}
  {% do run_query("put 'file://" ~ doc_path ~ "' @" ~ stage ~ " auto_compress = false overwrite = true") %}
  {% set publish %}
    execute immediate $$
    declare
      doc varchar;
    begin
      select to_json(object_insert($1, 'semantic_model',
               array_construct(object_insert($1:semantic_model[0], 'name', '{{ view_name }}', true)), true))
        into :doc
        from @{{ stage }}/osi_document.json;
      call system$create_semantic_view_from_ossie_yaml('{{ schema }}', :doc);
      return 'published {{ schema }}.{{ view_name }}';
    end;
    $$
  {% endset %}
  {% set result = run_query(publish) %}
  {{ log(result.columns[0].values()[0], info=true) }}
{% endif %}
{% endmacro %}
