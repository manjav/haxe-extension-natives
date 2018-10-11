package com.gerantech.extension;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

import com.gerantech.extension.listeners.CustomPhoneStateListener;

import android.content.Context;
import android.os.Build;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

public class Telephony extends Extension
{
	private static TelephonyManager manager;
	private static CustomPhoneStateListener listener;

    public static String getDeviceInfo()
    {
		Log.w("LOG_TAG", "DeviceInfo called");
		String imei = "No IMEI";
//		try {
//			imei = getManager().getDeviceId();
//		}
//		catch (Exception e) { e.printStackTrace(); }
		List<String> args = new ArrayList<>();
		try
		{
			 args.add(Build.VERSION.SDK_INT + "");
			 args.add(Build.MODEL);
			 args.add(Build.MANUFACTURER);
			 args.add(Build.DEVICE);
			 args.add(Build.PRODUCT);
			 args.add(Build.BRAND);
			 args.add("No ID");//Settings.Secure.getString(context.getActivity().getContentResolver(), "android_id")
			 args.add(imei);
		 }
	    catch (Exception e) { e.printStackTrace(); }
		return String.join(",", args);
    }
	
	public static void addListener(final HaxeObject callback)
	{
		mainActivity.runOnUiThread(new Runnable() { 

		public void run() {
        	if(listener != null)
        		return;
        	
        	listener = new CustomPhoneStateListener(mainActivity, callback);
        	addListener();
        }
      });
	}
	
	
	private static void addListener()
	{
		if(listener != null)
        	getManager().listen(listener, PhoneStateListener.LISTEN_CALL_STATE);
	}
	private static void removeListeners()
	{
		if(listener != null)
			getManager().listen(listener, PhoneStateListener.LISTEN_NONE);
	}
	
	
	private static TelephonyManager getManager() 
	{
		if(manager == null){
//			PermissionsActivity.extensionContext = mainContext;
//			if( PermissionsActivity.checkPermission(mainActivity, Manifest.permission.READ_PHONE_STATE, 0) )
			manager = (TelephonyManager) mainContext.getSystemService(Context.TELEPHONY_SERVICE);
		}

		return manager;
	}
}
