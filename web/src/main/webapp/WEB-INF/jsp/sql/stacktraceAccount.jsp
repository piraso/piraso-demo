<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Docs nav
================================================== -->
<div class="row">
    <div class="span3 bs-docs-sidebar">
        <ul class="nav nav-list bs-docs-sidenav">
            <li><a href="#sql-overview"><i class="icon-chevron-right"></i> <fmt:message key="overview"/></a></li>
            <li><a href="#add-account"><i class="icon-chevron-right"></i> Add Account</a></li>
            <li><a href="#list-account"><i class="icon-chevron-right"></i> List Account</a></li>
            <li><a href="#what-next"><i class="icon-chevron-right"></i> What Next?</a></li>
            <li><a href="#comments"><i class="icon-chevron-right"></i> Comments</a></li>
        </ul>
    </div>
    <div class="span9">

        <jsp:include page="accountOverview.jsp"/>

        <section id="add-account">
            <div class="page-header">
                <h1>Add Account</h1>
            </div>

            <jsp:include page="../account/add-account.jsp" />

            <div id="add-account-expected-failed" class="expected-result hide">
                <h3><i class="icon-star-empty"></i> Expected Results</h3>

                <p>
                    No statement was executed but a connection <code>rollback</code> was invoked.
                </p>

                <img src="<c:url value="/assets/img/sql-add-stacktrace-failed.png"/>">
            </div>

            <div id="add-account-expected-success" class="expected-result hide">
                <h3><i class="icon-star-empty"></i> Expected Results</h3>

                <p>
                    An <code>insert</code> statement was triggered after the successful saving of account.
                </p>

                <img src="<c:url value="/assets/img/sql-add-stacktrace-success.png"/>">
            </div>
        </section>

        <section id="list-account">
            <div class="page-header">
                <h1>List Accounts</h1>
            </div>

            <jsp:include page="../account/list-account.jsp" />

            <div id="load-account-expected-success" class="expected-result hide">
                <h3><i class="icon-star-empty"></i> Expected Results</h3>

                <p>
                    A <code>select</code> statement was triggered after the successful loading of accounts.
                </p>

                <img src="<c:url value="/assets/img/sql-stacktrace-list.png"/>">
            </div>

            <div id="activate-account-expected-success" class="expected-result hide">
                <h3><i class="icon-star-empty"></i> Expected Results</h3>

                <p>
                    A <code>update</code> statement was triggered after the successful activation of selected accounts.
                </p>

                <img src="<c:url value="/assets/img/sql-activate-stacktrace-success.png"/>">
            </div>

            <div id="archive-account-expected-success" class="expected-result hide">
                <h3><i class="icon-star-empty"></i> Expected Results</h3>

                <p>
                    A <code>update</code> statement was triggered after the successful archiving of selected accounts.
                </p>

                <img src="<c:url value="/assets/img/sql-archive-stacktrace-success.png"/>">
            </div>

            <div id="delete-account-expected-success" class="expected-result hide">
                <h3><i class="icon-star-empty"></i> Expected Results</h3>

                <p>
                    A <code>delete</code> statement was triggered after the successful deletion of selected accounts.
                </p>

                <img src="<c:url value="/assets/img/sql-delete-stacktrace-success.png"/>">
            </div>
        </section>

        <section id="what-next">
            <div class="page-header">
                <h1>What Next?</h1>
            </div>
            <p class="lead">Next step is to create your own sql monitors. You can customize your monitor by specifying sql preferences.</p>
            <a class="btn btn-success btn-large" href="http://piraso.org/user-guide.html">Client User Guide &raquo;</a>
        </section>

        <jsp:include page="../common/comments.jsp"/>
    </div>
</div>
