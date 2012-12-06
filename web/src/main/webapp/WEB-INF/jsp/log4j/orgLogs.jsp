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
                Switch back to piraso client platform and you'll see the results specified below.
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
            <p class="lead">Next step is to create your own log4j monitor. You can customize your monitor by specifying log4j preferences.</p>
            <a class="btn btn-success btn-large" href="http://piraso.org/user-guide.html">Client User Guide &raquo;</a>
        </section>
        <section id="comments">
            <div class="page-header">
                <h1>Comments</h1>
            </div>
            <div id="disqus_thread"></div>
            <script type="text/javascript">
                /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                var disqus_shortname = 'piraso-demo'; // required: replace example with your forum shortname

                /* * * DON'T EDIT BELOW THIS LINE * * */
                (function() {
                    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                    dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
                    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                })();
            </script>
            <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
            <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
        </section>
    </div>
</div>
