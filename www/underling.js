var exec = cordova.require("cordova/exec");

var underlingStarted = false;

function Underling() {

    this.Constants = {
        KEY: "VALUE"
    };

}

Underling.prototype.start = function (successCallback, errorCallback, options) {

    if (underlingStarted) {
        errorCallback('Underling is already started.');
        return true;
    }

    if (typeof(options) !== 'object') {
        errorCallback("options are required.");
        return true;
    }

    exec(
        function(result) {
            underlingStarted = true;
            successCallback(result);
        },
        function(error) {
            errorCallback(error);
        },
        'Underling',
        'start',
        [options]
    );
};

Underling.prototype.stop = function (successCallback, errorCallback) {
    exec(
        function(result) {
            underlingStarted = false;
            successCallback(result);
        },
        function(error) {
            errorCallback(error);
        },
        'Underling',
        'stop',
        []
    );
};

var underling = new Underling();
module.exports = underling;
