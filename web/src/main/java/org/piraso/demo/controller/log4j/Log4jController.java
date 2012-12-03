package org.piraso.demo.controller.log4j;

import org.apache.commons.lang.Validate;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Testing all log4j log levels
 */
@Controller
public class Log4jController {

    private static final Logger MAIN_LOG = Logger.getLogger("demo.main");
    private static final Logger SECURITY_LOG = Logger.getLogger("demo.security");
    private static final Logger APP_LOG = Logger.getLogger("demo.application");

    @RequestMapping("/logs")
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

    @RequestMapping("/")
    public String home(@RequestParam String type) {
        Validate.notEmpty(type, "type should not be empty");

        return String.format("log4j.%s.home", type);
    }
}
