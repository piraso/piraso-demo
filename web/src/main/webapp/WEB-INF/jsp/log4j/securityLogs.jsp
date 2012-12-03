<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Docs nav
================================================== -->
<div class="row">
    <div class="span3 bs-docs-sidebar">
        <ul class="nav nav-list bs-docs-sidenav">
            <li><a href="#expected"><i class="icon-chevron-right"></i> <fmt:message key="expected"/></a></li>
            <li><a href="#what-next"><i class="icon-chevron-right"></i> What Next?</a></li>
        </ul>
    </div>
    <div class="span9">

        <section id="expected">
            <div class="page-header">
                <h1><fmt:message key="expected"/></h1>
            </div>
            <p class="lead">
                Here is what to be expected from the Piraso client platform.
                Switch back to piraso client platform and you'll see the results specified below.
            </p>

            <h3>Monitor Results</h3>

            <p>
                <img src="<c:url value="/assets/img/log4j-security.png"/>">
            </p>

            <div class="alert alert-info">
                Take note that no <code>TRACE</code>, <code>DEBUG</code> entries are logged from the monitor.
                And only for <code>demo.security</code> log entries are available.
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
