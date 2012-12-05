package org.piraso.core.change;

import org.apache.commons.lang.builder.CompareToBuilder;
import org.springframework.beans.BeanWrapper;

import java.util.Comparator;

/**
 * Model for a specific change
 */
public class PossibleChange<T> {

    protected BeanWrapper wrapper;

    protected String name;

    protected Comparable<T> comparable1;

    protected Comparable<T> comparable2;

    protected Comparator<Comparable<T>> comparator;

    protected ApplyChange applyChange;

    public PossibleChange(BeanWrapper wrapper, String name, Comparable<T> comparable1, Comparable<T> comparable2, Comparator<Comparable<T>> comparator) {
        this.wrapper = wrapper;
        this.name = name;
        this.comparator = comparator;
        this.comparable1 = comparable1;
        this.comparable2 = comparable2;

        if(wrapper != null) {
            applyChange = new BeanWrapperApplyChange();
        }
    }

    public PossibleChange(BeanWrapper wrapper, String name, Comparable<T> comparable1, Comparable<T> comparable2) {
        this(wrapper, name, comparable1, comparable2, null);
    }

    public PossibleChange(String name, Comparable<T> comparable1, Comparable<T> comparable2) {
        this(null, name, comparable1, comparable2, null);
    }

    public void apply() {
        applyChange.apply(this);
    }

    public boolean hasChanged() {
        if(comparator != null) {
            return comparator.compare(comparable1, comparable2) != 0;
        } else {
            return new CompareToBuilder().append(comparable1, comparable2).toComparison() != 0;
        }
    }

    public Comparable<T> getComparable1() {
        return comparable1;
    }

    public Comparable<T> getComparable2() {
        return comparable2;
    }

    public String getName() {
        return name;
    }
}
