SELECT row_to_json(r) AS DATA
FROM (
     WITH comments as (
         SELECT tablename
         FROM pg_catalog.pg_tables
         WHERE schemaname != 'pg_catalog' AND schemaname != 'information_schema'
     )
     SELECT obj_description(oid) as table_comment,
            relname, TABLE_NAME, COLUMN_NAME, data_type,
            (
                SELECT pg_catalog.col_description(c.oid, cols.ordinal_position::int)
                FROM pg_catalog.pg_class c
                WHERE c.oid = (SELECT ('"' || cols.table_name || '"')::regclass::oid)
                  AND c.relname = cols.table_name
            ) AS column_comment
     FROM INFORMATION_SCHEMA.COLUMNS as cols, pg_class, comments
     WHERE TABLE_NAME = tablename  AND relname = tablename
) r;


SELECT row_to_json(r) AS DATA
FROM
    (WITH pt_study AS
              (SELECT COUNT(*) AS pt_study
               FROM "pt_study"),
          chemical_pathway_association AS
              (SELECT COUNT(*) AS chemical_pathway_association
               FROM "chemical_pathway_association"),
          pt_gene_prot_id_conversion AS
              (SELECT COUNT(*) AS pt_gene_prot_id_conversion
               FROM "pt_gene_prot_id_conversion"),
          pt_organism AS
              (SELECT COUNT(*) AS pt_organism
               FROM "pt_organism"),
          functional_feature_set AS
              (SELECT COUNT(*) AS functional_feature_set
               FROM "functional_feature_set"),
          ortholog_mapping_table AS
              (SELECT COUNT(*) AS ortholog_mapping_table
               FROM "ortholog_mapping_table"),
          pt_range_finding_report AS
              (SELECT COUNT(*) AS pt_range_finding_report
               FROM "pt_range_finding_report"),
          pt_proteome AS
              (SELECT COUNT(*) AS pt_proteome
               FROM "pt_proteome"),
          entity_type AS
              (SELECT COUNT(*) AS entity_type
               FROM "entity_type"),
          range_finding_raw_data AS
              (SELECT COUNT(*) AS range_finding_raw_data
               FROM "range_finding_raw_data"),
          entity_list AS
              (SELECT COUNT(*) AS entity_list
               FROM "entity_list"),
          "range_finding_ECx_and_BMDs" AS
              (SELECT COUNT(*) AS "range_finding_ECx_and_BMDs"
               FROM "range_finding_ECx_and_BMDs"),
          pt_metabolite_peak_intensity AS
              (SELECT COUNT(*) AS pt_metabolite_peak_intensity
               FROM "pt_metabolite_peak_intensity"),
          pt_sample_table AS
              (SELECT COUNT(*) AS pt_sample_table
               FROM "pt_sample_table"),
          pt_rna_seq_contrast AS
              (SELECT COUNT(*) AS pt_rna_seq_contrast
               FROM "pt_rna_seq_contrast"),
          pt_rna_seq_gene_count AS
              (SELECT COUNT(*) AS pt_rna_seq_gene_count
               FROM "pt_rna_seq_gene_count"),
          pt_chemical AS
              (SELECT COUNT(*) AS pt_chemical
               FROM "pt_chemical") SELECT pt_study.*,
                                          chemical_pathway_association.*,
                                          pt_gene_prot_id_conversion.*,
                                          pt_organism.*,
                                          functional_feature_set.*,
                                          ortholog_mapping_table.*,
                                          pt_range_finding_report.*,
                                          pt_proteome.*,
                                          entity_type.*,
                                          range_finding_raw_data.*,
                                          entity_list.*,
                                          "range_finding_ECx_and_BMDs".*,
                                          pt_metabolite_peak_intensity.*,
                                          pt_sample_table.*,
                                          pt_rna_seq_contrast.*,
                                          pt_rna_seq_gene_count.*,
                                          pt_chemical.*
     FROM pt_study,
          chemical_pathway_association,
          pt_gene_prot_id_conversion,
          pt_organism,
          functional_feature_set,
          ortholog_mapping_table,
          pt_range_finding_report,
          pt_proteome,
          entity_type,
          range_finding_raw_data,
          entity_list,
          "range_finding_ECx_and_BMDs",
          pt_metabolite_peak_intensity,
          pt_sample_table,
          pt_rna_seq_contrast,
          pt_rna_seq_gene_count,
          pt_chemical) r;