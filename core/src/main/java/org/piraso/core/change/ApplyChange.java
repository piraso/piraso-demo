package org.piraso.core.change;

/**
 * Defines an interface of applying changes
 */
public interface ApplyChange {

    /**
     * Applies a particular change.
     *
     * @param change the change.
     */
    public void apply(PossibleChange change);
}
