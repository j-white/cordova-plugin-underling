package ca.jessewhite.underling;

import org.json.JSONArray;
import org.json.JSONObject;

import android.util.Log;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

public class Underling extends CordovaPlugin {

    private static final String LOG_TAG = "Underling";

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {
        if (action.equals("start")) {
            JSONObject obj = args.optJSONObject(0);
            if (obj != null) {
                String mq = obj.optString("mq");
                String instanceId = obj.optString("instanceId");
                String location = obj.optString("location");
                String minionId = obj.optString("minionId");
                start(callbackContext, mq, instanceId, location, minionId);
            } else {
                callbackContext.error("Missing options.");
                return true;
            }
            return true;
        } else if (action.equals("stop")) {
            stop(callbackContext);
            return true;
        }
        return false;
    }

    public void start(final CallbackContext callbackContext, final String mq, final String instanceId, final String location, final String minionId) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                Log.i(LOG_TAG, "Starting underling....");
                go.underling.bindings.Bindings.startUnderling(mq, instanceId, location, minionId);
                Log.i(LOG_TAG, "Started underling.");
            }
        });
        callbackContext.success("OK");
    }

    public void stop(CallbackContext callbackContext) {
        cordova.getThreadPool().execute(new Runnable() {
            @Override
            public void run() {
                Log.i(LOG_TAG, "Stopping underling....");
                go.underling.bindings.Bindings.stopUnderling();
                Log.i(LOG_TAG, "Stopping underling.");
            }
        });
        callbackContext.success("OK");
    }
}
