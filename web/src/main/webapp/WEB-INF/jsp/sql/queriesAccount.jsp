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
        </ul>
    </div>
    <div class="span9">

        <jsp:include page="accountOverview.jsp"/>

        <section id="add-account">
            <div class="page-header">
                <h1>Add Account</h1>
            </div>

            <jsp:include page="../account/add-account.jsp" />

            <div id="add-account-expected-failed" class="hide">
                <h3>Expected Results</h3>

                <p>
                    No statement was executed but a connection <code>rollback</code> was invoked.
                </p>

                <img src="<c:url value="/assets/img/sql-statement-failed.png"/>">
            </div>

            <div id="add-account-expected-success" class="hide">
                <h3>Expected Results</h3>

                <p>
                    An <code>insert</code> statement was triggered after the successful saving of account.
                </p>

                <img src="<c:url value="/assets/img/sql-add-statement.png"/>">
            </div>
        </section>

        <section id="list-account">
            <div class="page-header">
                <h1>List Accounts</h1>
            </div>

            <jsp:include page="../account/list-account.jsp" />

            <div id="load-account-expected-success" class="hide">
                <h3>Expected Results</h3>

                <p>
                    A <code>select</code> statement was triggered after the successful loading of account.
                </p>

                <img src="<c:url value="/assets/img/sql-statement-list.png"/>">
            </div>

        </section>

        <section id="what-next">
            <div class="page-header">
                <h1>What Next?</h1>
            </div>
            <p class="lead">We can also monitor log4j with DEBUG log levels. Click on the button below for the next demonstration.</p>
            <a class="btn btn-success btn-large" href="<c:url value="/log4j/"><c:param name="type" value="debug"/></c:url> ">Debug Level Demo &raquo;</a>
        </section>
    </div>
</div>
