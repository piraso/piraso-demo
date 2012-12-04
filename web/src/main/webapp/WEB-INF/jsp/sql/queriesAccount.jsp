<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Docs nav
================================================== -->
<div class="row">
    <div class="span3 bs-docs-sidebar">
        <ul class="nav nav-list bs-docs-sidenav">
            <li><a href="#add-account"><i class="icon-chevron-right"></i> Add Account</a></li>
            <li><a href="#list-account"><i class="icon-chevron-right"></i> List Account</a></li>
            <li><a href="#start"><i class="icon-chevron-right"></i> <fmt:message key="start.demo"/></a></li>
        </ul>
    </div>
    <div class="span9">

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

        <section id="start">
            <div class="page-header">
                <h1><fmt:message key="start.demo"/></h1>
            </div>
            <p class="lead">This will demonstrate log4j monitoring for <code>demo</code> loggers with <code>ALL</code> levels. Follow the steps provided before continuing.</p>

            <h3>Instructions</h3>

            <p>
                Please follow these Piraso client platform instructions.
            </p>

            <p><span class="badge badge-success">1</span> Open Piraso client platform.</p>
            <p><span class="badge badge-info">2</span> Click on <code>File > New Monitor Instance > Monitor: [DEMO] - log4j - all levels</code>.</p>

            <p>
                <img src="<c:url value='/assets/img/new-monitor.png'/>" alt="">
                <img src="<c:url value='/assets/img/log4j-all-monitor-menu.png'/>" alt="">
            </p>

            <h3>Proceed Demo</h3>

            <p>Clicking on Proceed Demo will execute the logging codes above.</p>

            <a class="btn btn-success btn-large" href="<c:url value="/log4j/logs"><c:param name="type" value="${param['type']}"/></c:url> ">Proceed Demo &raquo;</a>
        </section>
    </div>
</div>
