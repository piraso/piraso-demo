package com.piraso.core.change;

import org.apache.commons.lang.Validate;

/**
 * Automatic change apply
 */
public class BeanWrapperApplyChange implements ApplyChange {

    /**
     * {@inheritDoc}
     */
    public void apply(PossibleChange change) {
        Validate.notNull(change.wrapper, "'wrapper' should not be null.");

        change.wrapper.setPropertyValue(change.name, change.comparable2);
    }
}
