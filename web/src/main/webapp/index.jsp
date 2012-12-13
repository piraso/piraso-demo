<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Piraso Demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Development tool for debugging and analyzing request context log information captured from a supported java module.">
    <meta name="author" content="alvinrdeleon">

    <!-- Le styles -->
    <link href="<c:url value='assets/css/bootstrap.css'/>" rel="stylesheet">
    <link href="<c:url value='assets/css/responsive.css'/>" rel="stylesheet">
    <link href="<c:url value='assets/css/font-awesome.css'/>" rel="stylesheet">
    <link href="<c:url value='assets/css/doc.css'/>" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="<c:url value='assets/ico/favicon.ico'/>">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value='assets/ico/apple-touch-icon-144-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value='assets/ico/apple-touch-icon-114-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value='assets/ico/apple-touch-icon-72-precomposed.png'/>">
    <link rel="apple-touch-icon-precomposed" href="<c:url value='assets/ico/apple-touch-icon-57-precomposed.png'/>">
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a id="piraso_logo" class="brand" href="http://piraso.org/">iraso</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;">Application Logging <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value='/log4j/'><c:param name="type" value="all"/></c:url>">All Logging Levels</a></li>
                            <li><a href="<c:url value='/log4j/'><c:param name="type" value="debug"/></c:url>">Debug Logging Level</a></li>
                            <li><a href="<c:url value='/log4j/'><c:param name="type" value="error"/></c:url>">Error or Warning Logging Level</a></li>
                            <li><a href="<c:url value='/log4j/'><c:param name="type" value="security"/></c:url>">Security Logger</a></li>
                            <li><a href="<c:url value='/log4j/'><c:param name="type" value="org"/></c:url>">Third Party Loggers</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;">SQL Execution <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value='/sql/'><c:param name="type" value="queries"/></c:url>">SQL Statements</a></li>
                            <li><a href="<c:url value='/sql/'><c:param name="type" value="data"/></c:url>">SQL Result Sets</a></li>
                            <li><a href="<c:url value='/sql/'><c:param name="type" value="stacktrace"/></c:url>">SQL Method Stack trace</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="container">

    <!-- Main hero unit for a primary marketing message or call to action -->
    <div class="hero-unit">
        <h1 id="hero_logo">
            <span class="icon"><img src="http://piraso.org/piraso_128.png"/></span><span class="text">iraso Live Demos</span>
        </h1>
        <p>Development tool for debugging and analyzing request context log information captured from a supported java module.</p>

        <div class="pull-right">
            <iframe src="http://ghbtns.com/github-btn.html?user=piraso&repo=piraso&type=watch&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="85px" height="20px"></iframe>
            <iframe class="github-btn" src="http://ghbtns.com/github-btn.html?user=piraso&repo=piraso&type=fork&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="80px" height="20px"></iframe>
            <iframe class="github-btn" src="http://ghbtns.com/github-btn.html?user=alvinrdeleon&type=follow&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="200px" height="20px"></iframe>
        </div>
        <p>
            <a class="btn btn-primary btn-large" href="<c:url value='/log4j/'><c:param name="type" value="all"/></c:url>">Application Logging &raquo;</a>
            <a class="btn btn-large" href="<c:url value='/sql/'><c:param name="type" value="queries"/></c:url>">SQL Executions &raquo;</a>
        </p>
    </div>

    <!-- Example row of columns -->
    <div class="row about">
        <div class="span4">
            <h3><i class="icon-bolt icon-large"></i> Easy to Setup</h3>
            <p>Enable your web application with a simple <a href="http://maven.apache.org/">maven</a> profile.</p>
        </div>
        <div class="span4">
            <h3><i class="icon-github icon-large"></i> Open Source</h3>
            <p>Piraso are licensed under <a href="http://www.apache.org/licenses/LICENSE-2.0">Apache 2.0</a> and maintained by the community on <a href="https://github.com/piraso" target="_blank">GitHub</a>.</p>
        </div>
        <div class="span4">
            <h3><i class="icon-leaf icon-large"></i> Spring Framework</h3>
            <p>Piraso uses <a href="">Spring Framework</a>, which is the most popular application development framework for enterprise Java™.</p>
        </div>
        <div class="span4">
            <h3><i class="icon-cogs icon-large"></i> Modular</h3>
            <p>Developers can choose to enable specific context loggers for their web modules.</p>
        </div>
        <div class="span4">
            <h3><i class="icon-resize-full icon-large"></i> Extendable</h3>
            <p>Piraso is highly extendable. Developers could develop their own custom context loggers.</p>
        </div>
        <div class="span4">
            <h3><i class="icon-rss icon-large"></i> Stay Updated</h3>
            <p>Be notified about updates by subscribing via <a href="#">RSS feed</a> or <a href="#">email</a>.</p>
        </div>
    </div>

    <hr>

    <footer>
        <div class="row">
            <div class="span5">
                <h3>Contact</h3>
                <ul class="icons">
                    <li><i class="icon-envelope"></i> Email: <a href="mailto:alvinrdeleon@me.com">Alvin R. de Leon</a></li>
                    <li><i class="icon-linkedin"></i> Linkedin: <a target="_blank" href="http://www.linkedin.com/in/alvinrdeleon">http://www.linkedin.com/in/alvinrdeleon</a></li>
                    <li><i class="icon-wrench"></i> Work: Staff Software Engineer @ <a target="_blank" href="http://adchemy.com">Adchemy</a></li>
                </ul>
            </div>
            <div class="span6">
                <h3>Special Thanks</h3>
                Special thanks to <a target="_blank" href="https://github.com/ashier">@ashier</a>,
                <a target="_blank" href="https://github.com/badong2210">@badong2210</a>, <a href="https://www.facebook.com/jctmendoza">@jctmendoza</a>, and <a href="https://twitter.com/bernardlago">@bernardlago</a> for design
                review, advice, and some help.
            </div>
        </div>
    </footer>

</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<c:url value='assets/js/jquery.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-transition.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-alert.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-modal.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-dropdown.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-scrollspy.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-tab.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-tooltip.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-popover.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-button.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-collapse.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-carousel.js'/>"></script>
<script src="<c:url value='assets/js/bootstrap-typeahead.js'/>"></script>

</body>
</html>
