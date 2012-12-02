package com.piraso.core.dbmigrator;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 * Creates a schema
 */
public class SchemaCreator {
    private JdbcTemplate jdbcTemplate;

    private String schema;

    public SchemaCreator(JdbcTemplate jdbcTemplate, String schema) {
        this.jdbcTemplate = jdbcTemplate;
        this.schema = schema;
    }

    public String getSchema() {
        return schema;
    }

    public void create() {
        jdbcTemplate.execute(String.format("CREATE SCHEMA %s AUTHORIZATION SA", schema));
        jdbcTemplate.execute(String.format("SET SCHEMA %s", schema));
    }
}
