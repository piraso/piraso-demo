<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://piraso.org/taglibs/scripts" prefix="scripts" %>

<p class="lead">
    Add an account by filling the form below.
</p>

<form id="add-form" class="form-horizontal">

    <div id="add-form-alert-success" class="alert alert-success hide">
        <button class="close close-confirmation" type="button">&times;</button>
        <strong>Success!</strong> Account was successfully saved.
    </div>

    <div id="add-form-alert-failed" class="alert alert-danger hide">
        <button class="close close-confirmation" type="button">&times;</button>
        <strong>Failure!</strong> Failed saving account.
    </div>

    <div  id="name-group" class="control-group">
        <label class="control-label" for="name">Name</label>
        <div class="controls">
            <input type="text" id="name" placeholder="Name" class="input-xlarge">
            <span class="help-inline hide">Field required.</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="description">Description</label>
        <div class="controls">
            <textarea id="description" rows="3" placeholder="Description (Optional)" class="input-xlarge"></textarea>
        </div>
    </div>

    <div class="form-actions">
        <button id="add-form-save" type="submit" class="btn btn-primary" data-loading-text="Saving...">Save</button>
        <button type="reset" class="btn">Reset</button>
    </div>
</form>

<scripts:in>
<script type="text/javascript">
    window.ADD_ACCOUNT_URL = "<c:url value='/account/add'/>";
</script>
</scripts:in>

