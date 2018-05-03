@objc(BmsCordovaSdkPublic) class BmsCordovaSdkPublic : CDVPlugin {
	@objc(initCustomer:)
	func initCustomer(command: CDVInvokedUrlCommand) {
		var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)

		let msg = command.arguments[0] as? String ?? ""

		pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: msg)

		self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
	}
}