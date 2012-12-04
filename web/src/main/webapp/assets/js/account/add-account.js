(function() {
    var _saveButton = $("#add-form-save");

    var AddAccount = function() {
        var _successCallback = function(status) {
            _saveButton.button('reset');
            $("#name").val("");
            $("#description").val("");

            if(status == 'SUCCESS') {
                $("#add-form-alert-success").show("fade");
                $("#name").val("");
                $("#description").val("");
                $("#add-account-expected-success").show("fade");
            } else {
                $("#add-form-alert-failed").show("fade");
                $("#add-account-expected-failed").show("fade");
            }
        };

        var _errorCallback = function() {
            alert("Error while adding account.");
        };

        return {
            invoke: function() {
                var name = $("#name").val();
                var desc = $("#description").val();

                $("#add-form-alert-failed").hide("fade");
                $("#add-form-alert-success").hide("fade");
                $("#add-account-expected-success").hide("fade");
                $("#add-account-expected-failed").hide("fade");

                if(!$.trim(name)) {
                    $("#name-group").addClass("error");
                    $("#name-group").find(".help-inline").removeClass("hide");
                    $("#name").focus();

                    return;
                }

                $("#name-group").removeClass("error");
                $("#name-group").find(".help-inline").addClass("hide");

                _saveButton.button('loading');

                $.ajax({
                    async: false,
                    url: window.ADD_ACCOUNT_URL,
                    type: "POST",
                    data: "name=" + encodeURIComponent(name) + "&description=" + encodeURIComponent(desc),
                    dataType: "json",
                    error: _errorCallback,
                    success: _successCallback
                });
            }
        };
    };

    _saveButton.click(function() {
        new AddAccount().invoke();
    });

    $("#add-form").submit(function(event) {
        event.stopImmediatePropagation();
        event.preventDefault();
        return false;
    });

    $("#add-form-alert-failed .close-confirmation").click(function() {
        $("#add-form-alert-failed").hide("fade");
    });

    $("#add-form-alert-success .close-confirmation").click(function() {
        $("#add-form-alert-success").hide("fade");
    });
})();