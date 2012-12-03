<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section id="log4j-overview">
    <div class="page-header">
        <h1><fmt:message key="overview"/></h1>
    </div>
    <p class="lead">
        This demonstrate how Piraso was able to capture the application log4j logging entries.
        Before we proceed with the demonstration, this section will provide and describe how the application was design for logging.
    </p>

    <div id="log4j-properties">
        <h3>log4j.properties</h3>

        <p>
            This shows the <code>log4j.properties</code> used by the application.
            As you can see the setup logging level is set to <code>INFO</code>, similar to a production environment setup.
            With this there is no way for us to view <code>DEBUG</code> and <code>TRACE</code> logging levels on our log4j
            generated files.
        </p>

            <pre class="prettyprint linenums">
log4j.rootLogger=WARN, stdout

log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%d [%t] %-5p %c.%M:%L - %m%n

log4j.logger.org.piraso=INFO
log4j.logger.org.hibernate=INFO
log4j.logger.org.springframework=INFO
log4j.logger.com.carbonfive=INFO
</pre>

    </div>
    <div id="log4j-logging">
        <h3>Logging code snippet</h3>

        <p>
            The following line of codes are the java code that will be executed during this demonstration.
        </p>

<pre class="prettyprint linenums">
    private static final Logger MAIN_LOG = Logger.getLogger("demo.main");
    private static final Logger SECURITY_LOG = Logger.getLogger("demo.security");
    private static final Logger APP_LOG = Logger.getLogger("demo.application");

    @RequestMapping("/logs/")
    public String sampleLogging(@RequestParam String type) {
        Validate.notEmpty(type, "type should not be empty");

        MAIN_LOG.debug("Sample main log in DEBUG level.");
        SECURITY_LOG.debug("Sample security log in DEBUG level.");
        APP_LOG.debug("Sample security log in DEBUG level.");

        MAIN_LOG.trace("Sample main log in TRACE level.");
        SECURITY_LOG.trace("Sample security log in TRACE level.");
        APP_LOG.trace("Sample security log in TRACE level.");

        MAIN_LOG.info("Sample main log in INFO level.");
        SECURITY_LOG.info("Sample security log in INFO level.");
        APP_LOG.info("Sample security log in INFO level.");

        MAIN_LOG.warn("Sample main log in WARNING level.");
        SECURITY_LOG.warn("Sample security log in WARNING level.");
        APP_LOG.warn("Sample security log in WARNING level.");

        try {
            throw new IllegalStateException("Force exception");
        } catch(IllegalStateException e) {
            MAIN_LOG.error("Sample main log in ERROR level.", e);
            SECURITY_LOG.error("Sample security log in ERROR level.", e);
            APP_LOG.error("Sample security log in ERROR level.", e);
        }

        return String.format("log4j.%s.logs", type);
    }
</pre>
    </div>
</section>
