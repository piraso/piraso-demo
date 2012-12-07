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
                <img src="<c:url value="/assets/img/log4j-error.png"/>">
            </p>

            <div class="alert alert-info">
                Take note that no <code>TRACE</code>, <code>DEBUG</code>, and <code>INFO</code> entries are logged from the monitor.
            </div>
        </section>

        <section id="what-next">
            <div class="page-header">
                <h1>What Next?</h1>
            </div>
            <p class="lead">We can also monitor log4j using selected loggers. For the next demo we will only be showing <code>demo.security</code> logger with <code>INFO</code> logging level. Click on the button below for the next demonstration.</p>
            <a class="btn btn-primary btn-large" href="<c:url value="/log4j/"><c:param name="type" value="security"/></c:url> ">Security Logger Demo &raquo;</a>
        </section>

        <jsp:include page="../common/comments.jsp"/>

    </div>
</div>
