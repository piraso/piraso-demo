<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Docs nav
================================================== -->
<div class="row">
    <div class="span3 bs-docs-sidebar">
        <ul class="nav nav-list bs-docs-sidenav">
            <li><a href="#log4j-overview"><i class="icon-chevron-right"></i> <fmt:message key="overview"/></a></li>
            <li><a href="#log4j-properties"><i class="icon-chevron-right"></i> Log4j Properties</a></li>
            <li><a href="#log4j-logging"><i class="icon-chevron-right"></i> Logging code snippet</a></li>
            <li><a href="#start"><i class="icon-chevron-right"></i> <fmt:message key="start.demo"/></a></li>
        </ul>
    </div>
    <div class="span9">

        <jsp:include page="overview.jsp" />

        <section id="start">
            <div class="page-header">
                <h1><fmt:message key="start.demo"/></h1>
            </div>
            <p class="lead">
                We can also monitor log4j using third party loggers.
                For this demo we will only be showing <code>org</code> and <code>demo</code> loggers with <code>TRACE</code> and <code>INFO</code> logging levels.
                This will also show <code>StackTrace</code> for all log entries.
                Follow the steps provided before continuing.
            </p>

            <h3>Instructions</h3>

            <p>
            Please follow these Piraso client instructions.
            </p>

            <p><span class="badge badge-success">1</span> Open Piraso client application.</p>
            <p><span class="badge badge-info">2</span> Click on <code>File > New Monitor Instance > Monitor: [DEMO] - log4j - thirdparty - trace levels</code>.</p>

            <p>
            <img src="<c:url value='/assets/img/new-monitor.png'/>" alt="">
            <img src="<c:url value='/assets/img/log4j-thirdparty-monitor-menu.png'/>" alt="">
            </p>

            <p><span class="badge badge-important">3</span> Wait for Piraso client to connect, then proceed.</p>

            <p style="margin-left: 25px;">
                <img src="<c:url value='/assets/img/connectivity.png'/>" alt="">
            </p>

            <h3>Proceed Demo</h3>

            <p>Clicking on Proceed Demo will execute the logging codes above.</p>

            <a class="btn btn-success btn-large" href="<c:url value="/log4j/logs"><c:param name="type" value="${param['type']}"/></c:url> ">Proceed Demo &raquo;</a>
        </section>
    </div>
</div>
