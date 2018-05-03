@objc(BmsCordovaSdkPublic) class BmsCordovaSdkPublic : CDVPlugin {
	@objc(initCustomer:)
	func initCustomer(command: CDVInvokedUrlCommand) {
		var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR);

		let identifier = command.arguments[0] as? String ?? "no value";
		let phone = command.arguments[1] as? String ?? "no value";
		let email = command.arguments[2] as? String ?? "no value";

		print("BmsCordovaSdkPublic", identifier, phone, email);

		pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "done");

		self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
	}
}