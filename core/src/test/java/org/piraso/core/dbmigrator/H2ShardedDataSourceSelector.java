package org.piraso.core.dbmigrator;

import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

/**
 * An h2 implementation for sharded datasource selector.
 */
public class H2ShardedDataSourceSelector implements ShardedDataSourceSelector {

    private DataSource dataSource;

    private ShardProvider shardProvider;

    private JdbcTemplate jdbcTemplate;

    public H2ShardedDataSourceSelector(DataSource dataSource, ShardProvider shardProvider) {
        this.dataSource = dataSource;
        this.shardProvider = shardProvider;
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void init() {
        for(Integer shardID : shardProvider.getShardIDs()) {
            jdbcTemplate.execute(String.format("CREATE SCHEMA h2%d AUTHORIZATION SA", shardID));
        }
    }

    @Override
    public void switchShard(Integer id) {
        jdbcTemplate.execute(String.format("SET SCHEMA h2%d", id));
    }

    @Override
    public String getSchema(Integer id) {
        return String.format("h2%d", id);
    }

    @Override
    public DataSource getDataSource() {
        return dataSource;
    }
}
