var exec = require('cordova/exec');

exports.initSDK = function (sdkKey, success, error) {
    exec(success, error, 'BmsCordovaSdkPublic', 'initSDK', [sdkKey]);
};

exports.initCustomer = function (identifier, phone, email, success, error) {
    exec(success, error, 'BmsCordovaSdkPublic', 'initCustomer', [identifier, phone, email]);
};

exports.setting = function (alert, background, site, attendance, tracking, success, error) {
    exec(success, error, 'BmsCordovaSdkPublic', 'setting', [alert, background, site, attendance, tracking]);
};

exports.startSDK = function (success, error) {
    exec(success, error, 'BmsCordovaSdkPublic', 'startSDK', []);
};

exports.stopSDK = function (success, error) {
    exec(success, error, 'BmsCordovaSdkPublic', 'stopSDK', []);
};
