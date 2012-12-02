package com.piraso.core.dbmigrator;

import javax.sql.DataSource;

/**
 * single data source selector
 */
public class SingleDataSourceSelector implements DataSourceSelector {

    private DataSource dataSource;

    public SingleDataSourceSelector(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public DataSource getDataSource() {
        return dataSource;
    }
}
