(function() {

    var tableSize = 0;

    var loadButton = $("#list-form-load");
    var reloadButton = $("#list-form-reload");

    var _loadTable = function(json) {
        $("#list-tbody").html("");

        if(json.status == 'SUCCESS') {
            var _templateEl = $("#table-tr-template")[0];

            if(json.rows.length) {
                for(var i = 0; i < json.rows.length; i++) {
                    var row = json.rows[i];
                    var rowEl = _templateEl.cloneNode(true);
                    var id = "row-" + row.id;
                    rowEl.id = id;

                    $("#list-tbody").append(rowEl);

                    $("#" + id).find("input").attr("account-name", row.name);
                    $("#" + id).find(".name-column").text(row.name);
                    $("#" + id).find(".desc-column").text(row.description);
                    $("#" + id).find(".status-column span").text(row.status);

                    if(row.status == 'ACTIVE') {
                        $("#" + id).find(".status-column").addClass("status-active");
                        $("#" + id).find(".status-column i").addClass("icon-ok-sign");
                    } else if(row.status == 'ARCHIVED') {
                        $("#" + id).find(".status-column").addClass("status-archive");
                        $("#" + id).find(".status-column i").addClass("icon-remove-sign");
                    } else {
                        $("#" + id).find(".status-column").addClass("status-inactive");
                        $("#" + id).find(".status-column i").addClass("icon-minus-sign");
                    }
                }

                tableSize = $("#list-tbody input").length;
                _initCheckBoxes();
            } else {
                $("#list-tbody").html("<tr><td colspan='4'><p class='text-error'>No records found.</p></td></tr>");
            }
        } else {
            $("#list-tbody").html("<tr><td colspan='4'><p class='text-error'>Error while loading accounts.</p></td></tr>");
        }

        $("#list-container").show("fade");
    };

    var _errorCallback = function() {
        $("#list-tbody").html("<tr><td colspan='4'><p class='text-error'>Unexpected error.</p></td></tr>");
        $("#list-container").show("fade");
    };

    var LoadAccounts = function() {
        var _successCallback = function(json) {
            _loadTable(json);

            loadButton.hide("fade");
            loadButton.button('reset');
            reloadButton.button('reset');
        };

        return {
            invoke: function() {
                $.ajax({
                    async: false,
                    url: window.LOAD_ACCOUNTS_URL,
                    type: "GET",
                    dataType: "json",
                    error: _errorCallback,
                    success: _successCallback
                });
            }
        };
    };

    var refreshButtons = function() {
        var collector = new SchemeCollector();

        $(".account-checkbox").each(collector.handler);
        $(".account-checkbox").each(new EachRowSelector());

        $("#list-form-activate")[0].disabled = !collector.hasSelection();
        $("#list-form-archive")[0].disabled = !collector.hasSelection();
        $("#list-form-delete")[0].disabled = !collector.hasSelection();
    };

    var EachRowSelector = function() {
        return function(index, el) {
            if(el.checked) {
                $(el).parents("tr").addClass("active");
            } else {
                $(el).parents("tr").removeClass("active");
            }
        };
    };

    var SchemeCollector = function() {
        var _hasSelection = false;
        var _selected = [];

        return {
            hasSelection: function() {
                return _hasSelection;
            },

            getSelected: function() {
                return _selected;
            },

            handler: function(index, el) {
                if(el.checked) {
                    _hasSelection = true;
                    _selected.push($(el).attr("account-name"));
                }
            }
        };
    };

    loadButton.click(function() {
        loadButton.button('loading');
        $(".expected-result").hide("fade");

        $("#load-account-expected-success").show("fade");

        new LoadAccounts().invoke();
    });

    reloadButton.click(function() {
        reloadButton.button('loading');
        $(".expected-result").hide("fade");

        $("#load-account-expected-success").show("fade");

        new LoadAccounts().invoke();
    });

    $("#list-form-alert-failed .close-confirmation").click(function() {
        $("#list-form-alert-failed").hide("fade");
    });

    $("#list-form-alert-success .close-confirmation").click(function() {
        $("#list-form-alert-success").hide("fade");
    });

    var _initCheckBoxes = function() {
        $(".account-checkbox").click(function() {
            refreshButtons();
        });
        $(".account-checkbox").change(function() {
            refreshButtons();
        });

        refreshButtons();
    };

    var DoSelectionAction = function(action, selection) {
        var ACTIONS = {
            "activate": {
               "url": window.ACTIVATE_ACCOUNTS_URL,
               "message": "activated",
               "expected": "activate-account-expected-success"
            },
            "archive": {
               "url": window.ARCHIVE_ACCOUNTS_URL,
               "message": "archived",
                "expected": "archive-account-expected-success"
            },
            "delete": {
                "url": window.DELETE_ACCOUNTS_URL,
                "message": "deleted",
                "expected": "delete-account-expected-success"

            }
        };

        var _successCallback = function(json) {
            _loadTable(json);

            $("#list-form-alert-success").find("span.action").text(ACTIONS[action].message);
            $("#list-form-alert-success").show("fade");
            $("#" + ACTIONS[action].expected).show("fade");
        };

        return {
            invoke: function() {
                var data = "";
                for(var i = 0; i < selection.length; i++) {
                    if(i > 0) {
                        data += "&";
                    }

                    data += "names=" +  encodeURIComponent(selection[i]);
                }

                $(".expected-result").hide("fade");

                $.ajax({
                    async: false,
                    url: ACTIONS[action].url,
                    type: "POST",
                    data: data,
                    dataType: "json",
                    error: _errorCallback,
                    success: _successCallback
                });
            }
        };
    };

    $("#list-form-activate").click(function() {
        if($("#list-form-activate").hasClass("disabled")) return;

        var collector = new SchemeCollector();
        $(".account-checkbox").each(collector.handler);

        new DoSelectionAction("activate", collector.getSelected()).invoke();
    });

    $("#list-form-archive").click(function() {
        if($("#list-form-archive").hasClass("disabled")) return;

        var collector = new SchemeCollector();
        $(".account-checkbox").each(collector.handler);

        new DoSelectionAction("archive", collector.getSelected()).invoke();
    });

    $("#list-form-delete").click(function() {
        if($("#list-form-delete").hasClass("disabled")) return;

        var collector = new SchemeCollector();
        $(".account-checkbox").each(collector.handler);

        new DoSelectionAction("delete", collector.getSelected()).invoke();
    });

})();