var exec = require('cordova/exec');

exports.initCustomer = function (arg0, success, error) {
    exec(success, error, 'BmsCordovaSdkPublic', 'initCustomer', [arg0]);
};
