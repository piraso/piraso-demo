package org.piraso.core.entity;

import java.io.Serializable;

public interface VersionedEntity extends Serializable {

    Long getId();

    int getVersion();
}
