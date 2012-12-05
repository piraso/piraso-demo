<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section id="sql-overview">
    <div class="page-header">
        <h1><fmt:message key="overview"/></h1>
    </div>
    <p class="lead">
        This page has two sections that has database executions. This will demonstrate how piraso do monitoring of these
        SQL executions.
    </p>

    <h3>Add Account</h3>
    <p>This section supports the following SQL operations:</p>

    <ul>
        <li>On successful, you'll see a <code>insert</code> statement and <code>commit</code> connection monitored from piraso client.</li>
        <li>On failure, you'll see a <code>rollback</code> connection monitored from piraso client.</li>
    </ul>

    <h3>List Accounts</h3>
    <p>Try to insert accounts first, so you'll retrieve results when listing. This section supports the following SQL operations:</p>

    <ul>
        <li><strong>Load Accounts</strong>. Monitors for <code>select</code> statements.</li>
        <li><strong>Activate and Archive Accounts</strong>. Monitors for <code>update</code> statements.</li>
        <li><strong>Delete Accounts</strong>. Monitors for <code>delete</code> statements.</li>
    </ul>

    <h3>Expected Results</h3>

    <p>
        On every operation that has SQL execution, a section called <code>Expected Results</code> will appear.
        This will determine the expected results you'll see on the piraso client.
    </p>
</section>
