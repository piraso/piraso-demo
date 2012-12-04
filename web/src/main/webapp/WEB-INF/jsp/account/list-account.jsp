<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://piraso.org/taglibs/scripts" prefix="scripts" %>

<p class="lead">
    This will list all accounts. In here you will be able to activate, archive, and delete accounts.
</p>

<div class="hide">
    <table>
        <tr id="table-tr-template">
            <td class="checkbox-column"><input type="checkbox" class="account-checkbox"></td>
            <td class="name-column"></td>
            <td class="desc-column"></td>
            <td class="status-column"></td>
        </tr>
    </table>
</div>

<button id="list-form-load" type="button" class="btn btn-primary" data-loading-text="Loading accounts...">Load Accounts</button>

<div id="list-container" class="hide">

    <button id="list-form-reload" type="button" class="btn btn-primary" data-loading-text="Reloading accounts...">Reload Accounts</button>
    <button id="list-form-activate" type="button" class="btn btn-success" data-loading-text="Activating selected accounts..." disabled="disabled">Bulk Activate</button>
    <button id="list-form-archive" type="button" class="btn btn-warning" data-loading-text="Achieving selected accounts..." disabled="disabled">Bulk Archive</button>
    <button id="list-form-delete" type="button" class="btn btn-danger" data-loading-text="Deleting selected accounts..." disabled="disabled">Bulk Delete</button>

    <table id="list-table" class="table table-hover">
        <thead>
            <tr>
                <th class="checkbox-column">&nbsp;</th>
                <th class="name-column">Name</th>
                <th class="desc-column">Description</th>
                <th class="status-column">Status</th>
            </tr>
        </thead>
        <tbody id="list-tbody">
        </tbody>
    </table>
</div>

<scripts:in>
    <script type="text/javascript">
        window.LOAD_ACCOUNTS_URL = "<c:url value='/account/list'/>";
    </script>
</scripts:in>
