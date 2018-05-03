var exec = require('cordova/exec');

exports.initCustomer = function (identifier, phone, email, success, error) {
    exec(success, error, 'BmsCordovaSdkPublic', 'initCustomer', [identifier, phone, email]);
};
