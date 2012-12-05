package org.piraso.core.entity;

import java.io.Serializable;
import java.util.Date;

public interface AuditedEntity extends Serializable {

    String getCreatedBy();

    Date getCreatedTime();

    String getLastUpdatedBy();

    Date getLastUpdatedTime();
}
