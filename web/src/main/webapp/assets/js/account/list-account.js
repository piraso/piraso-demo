(function() {
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

                    $("#" + id).find(".name-column").text(row.name);
                    $("#" + id).find(".desc-column").text(row.description);
                    $("#" + id).find(".status-column").text(row.status);

                    if(row.status == 'ACTIVE') {
                        $("#" + id).addClass("success");
                    } else if(row.status == 'ARCHIVED') {
                        $("#" + id).addClass("danger");
                    }
                }

                $("#load-account-expected-success").show("fade");
            } else {
                $("#list-tbody").html("<tr><td colspan='4'>No records found.</td></tr>");
            }
        } else {
            $("#list-tbody").html("<tr><td colspan='4'>Error while loading accounts.</td></tr>");
        }

        $("#list-container").show("fade");
    };

    var _errorCallback = function() {
        $("#list-tbody").html("<tr><td colspan='4'>Unexpected error.</td></tr>");
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

    loadButton.click(function() {
        loadButton.button('loading');
        $("#load-account-expected-success").show("fade");

        new LoadAccounts().invoke();
    });

    reloadButton.click(function() {
        reloadButton.button('loading');
        $("#load-account-expected-success").show("fade");

        new LoadAccounts().invoke();
    });
})();