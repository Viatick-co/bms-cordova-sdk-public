package com.viatick.bmsandroidsdk.plugin;
// The native Toast API
import android.Manifest;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.widget.Toast;
// Cordova-required packages
import com.viatick.bmsandroidsdk.controller.ViaBmsCtrl;
import com.viatick.bmsandroidsdk.controller.ViaIBeaconCtrl;
import com.viatick.bmsandroidsdk.model.ViaBmsUtil;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PermissionHelper;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import static android.content.Context.BIND_AUTO_CREATE;

public class BmsCordovaSdkPublic extends CordovaPlugin {
  ViaBmsCtrl viaBmsCtrl = new ViaBmsCtrl();
  CallbackContext startServiceCallback;
  boolean isReady = false;

  @Override
  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);

    viaBmsCtrl = new ViaBmsCtrl();
  };

  @Override
  public boolean execute(String action, JSONArray args,
    final CallbackContext callbackContext) throws JSONException {
      if (action.equals("initCustomer")) {
          viaBmsCtrl.initCustomer(args.getString(0), args.getString(1),
                  args.getString(2), callbackContext);
          return true;
      } else if (action.equals("setting")) {
          viaBmsCtrl.settings(args.getBoolean(0), args.getBoolean(1),
                  args.getBoolean(2), args.getBoolean(3),
                  args.getBoolean(4), callbackContext);
          return true;
      } else if (action.equals("initSDK")) {
          viaBmsCtrl.initSdk(cordova.getActivity(), args.getString(0), callbackContext);
          return true;
      } else if (action.equals("startSDK")) {
          this.startServiceCallback = callbackContext;
          viaBmsCtrl.startBmsService(callbackContext);
          return true;
      } else if (action.equals("endSDK")) {
          viaBmsCtrl.stopBmsService(callbackContext);
          return true;
      }
      return false;
  };

    @Override
    public void onRequestPermissionResult(int requestCode, String[] permissions,
                                          int[] grantResults) throws JSONException {
        viaBmsCtrl.onRequestPermissionsResult(cordova.getActivity(), requestCode, permissions, grantResults);
    }

    @Override
    public void onResume(boolean multitasking) {
        super.onResume(multitasking);

        viaBmsCtrl.onResume(startServiceCallback);
    }
}
