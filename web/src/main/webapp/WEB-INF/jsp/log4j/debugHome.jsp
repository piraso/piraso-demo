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
            <p class="lead">Follow the steps provided and click on start to proceed with the demonstration.</p>


            <a class="btn btn-success btn-large" href="<c:url value="/log4j/logs"><c:param name="type" value="${param['type']}"/></c:url> ">Start &raquo;</a>
        </section>
    </div>
</div>
