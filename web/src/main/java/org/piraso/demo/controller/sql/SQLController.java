package org.piraso.demo.controller.sql;

import org.apache.commons.lang.Validate;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SQLController {

    private static final Logger LOG = Logger.getLogger(SQLController.class);

    @RequestMapping("/accounts")
    public String accounts(@RequestParam String type) {
        Validate.notEmpty(type, "type should not be empty");

        LOG.info(String.format("Account home accessed for type '%s'.", type));

        return String.format("sql.%s.accounts", type);
    }

    @RequestMapping("/")
    public String home(@RequestParam String type) {
        Validate.notEmpty(type, "type should not be empty");

        LOG.info(String.format("SQL home accessed for type '%s'.", type));

        return String.format("sql.%s.home", type);
    }
}
