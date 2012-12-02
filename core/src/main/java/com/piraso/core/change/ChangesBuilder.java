package com.piraso.core.change;

import org.apache.commons.lang.Validate;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

/**
 * Create a change object.
 */
public class ChangesBuilder {

    List<PossibleChange> changes = new LinkedList<PossibleChange>();

    BeanWrapper wrapper;

    public ChangesBuilder() {
        wrapper = null;
    }

    public ChangesBuilder(Object bean) {
        wrapper = new BeanWrapperImpl(bean);
    }

    @SuppressWarnings("unchecked")
    public ChangesBuilder add(String name, Comparable comparable2) {
        Validate.notNull(wrapper, "'wrapper' is required.");

        add(wrapper, name, (Comparable) wrapper.getPropertyValue(name), comparable2);
        return this;
    }

    @SuppressWarnings("unchecked")
    public ChangesBuilder add(String name, Comparable comparable2, Comparator comparator) {
        Validate.notNull(wrapper, "'wrapper' is required.");

        add(wrapper, name, (Comparable) wrapper.getPropertyValue(name), comparable2, comparator);
        return this;
    }

    @SuppressWarnings("unchecked")
    public ChangesBuilder add(String name, Comparable comparable1, Comparable comparable2) {
        if(wrapper != null) {
            add(wrapper, name, comparable1, comparable2);
        } else {
            changes.add(new PossibleChange(name, comparable1, comparable2));
        }

        return this;
    }

    @SuppressWarnings("unchecked")
    public ChangesBuilder add(BeanWrapper wrapper, String name, Comparable comparable1, Comparable comparable2) {
        changes.add(new PossibleChange(wrapper, name, comparable1, comparable2));

        return this;
    }

    @SuppressWarnings("unchecked")
    public ChangesBuilder add(BeanWrapper wrapper, String name, Comparable comparable1, Comparable comparable2, Comparator comparator) {
        changes.add(new PossibleChange(wrapper, name, comparable1, comparable2, comparator));

        return this;
    }

    public Changes build() {
        List<PossibleChange> built = new ArrayList<PossibleChange>(changes.size());

        for(PossibleChange change : changes) {
            built.add(change);
        }

        return new Changes(built);
    }
}
