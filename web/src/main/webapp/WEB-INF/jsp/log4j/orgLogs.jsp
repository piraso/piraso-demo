<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Docs nav
================================================== -->
<div class="row">
    <div class="span3 bs-docs-sidebar">
        <ul class="nav nav-list bs-docs-sidenav">
            <li><a href="#expected"><i class="icon-chevron-right"></i> <fmt:message key="expected"/></a></li>
            <li><a href="#what-next"><i class="icon-chevron-right"></i> What Next?</a></li>
            <li><a href="#comments"><i class="icon-chevron-right"></i> Comments</a></li>
        </ul>
    </div>
    <div class="span9">

        <section id="expected">
            <div class="page-header">
                <h1><i class="icon-star-empty"></i> <fmt:message key="expected"/></h1>
            </div>
            <p class="lead">
                After the page is loaded, here is what to be expected to appear from Piraso client platform.
                Switch back to piraso client and you'll see the results specified below.
            </p>

            <h3>Monitor Results</h3>

            <p>
                <img src="<c:url value="/assets/img/log4j-thirdparty.png"/>">
            </p>

            <div class="alert alert-info">
                Only for <code>org</code> log entries are available with <code>TRACE</code> logging levels and <code>demo</code> log entries with <code>INFO</code> logging levels
                with stack trace.
            </div>


            <h3>Log4j View</h3>

            <p>
                Try clicking on the any log entries and click on <code>Stacktrace</code> to see the log entry stack trace.
                Clicking on <img src="<c:url value='/assets/img/filter.png'/>" alt="" title="Filter"> will filter the preferred stack trace elements.
                With this you will be able to see the application class flow.
            </p>

            <img src="<c:url value="/assets/img/log4j-thirdparty-view.png"/>">
        </section>

        <section id="what-next">
            <div class="page-header">
                <h1>What Next?</h1>
            </div>
            <p class="lead">You can also check for the SQL Execution live demo. You can also start checking the client user guide.</p>
            <a class="btn btn-large" href="<c:url value='/sql/'><c:param name="type" value="queries"/></c:url>">SQL Executions &raquo;</a>
            <a class="btn btn-primary btn-large" style="margin-left: 5px;" href="http://piraso.org/user-guide.html">Client User Guide &raquo;</a>
        </section>

        <jsp:include page="../common/comments.jsp"/>
    </div>
</div>
