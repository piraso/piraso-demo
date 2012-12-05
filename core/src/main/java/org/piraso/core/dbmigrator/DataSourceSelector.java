package org.piraso.core.dbmigrator;

import javax.sql.DataSource;

/**
 * Provides a way to select data sources.
 */
public interface DataSourceSelector {

    /**
     * Retrieves the data source.
     *
     * @return {@link javax.sql.DataSource} selected
     */
    DataSource getDataSource();
}
