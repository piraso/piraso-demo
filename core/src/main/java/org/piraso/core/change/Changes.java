package org.piraso.core.change;

import org.apache.commons.collections.CollectionUtils;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Determines all the bean changes
 */
public class Changes {

    protected List<PossibleChange> possibleChanges;

    protected Map<String, PossibleChange> changes;

    protected boolean appliedChanges;

    public Changes(List<PossibleChange> possibleChanges) {
        this.possibleChanges = possibleChanges;
    }

    private Collection<PossibleChange> list() {
        if(changes != null) return changes.values();

        changes = new LinkedHashMap<String, PossibleChange>();

        for(PossibleChange c : possibleChanges) {
            if(c.hasChanged()) {
                changes.put(c.getName(), c);
            }
        }

        return changes.values();
    }

    public boolean hasChanges() {
        return appliedChanges && CollectionUtils.isNotEmpty(list());
    }

    public boolean hasChanged(String name) {
        return appliedChanges && changes.containsKey(name);
    }

    public boolean hasAppliedChanges() {
        return appliedChanges;
    }

    public void apply() {
        for(PossibleChange c : list()) {
            c.apply();
        }

        appliedChanges = true;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String toString() {
        return "Changes{}";
    }
}
