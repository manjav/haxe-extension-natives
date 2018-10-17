package com.gerantech.extension;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

import com.gerantech.extension.listeners.CustomPhoneStateListener;

import android.content.Context;
import android.os.Build;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;

public class NativeTelephony extends Extension
{
	private static TelephonyManager manager;
	private static CustomPhoneStateListener listener;

    public static String getDeviceInfo()
    {
		String imei = "No IMEI";
//		try {
//			imei = getManager().getDeviceId();
//		} catch (Exception e) { e.printStackTrace(); }
		String ret = "";
		ret += "BOARD:" + Build.BOARD;
		ret += ",BOOTLOADER:" + Build.BOOTLOADER;
		ret += ",BRAND:" + Build.BRAND;
		ret += ",DEVICE:" + Build.DEVICE;
		ret += ",DISPLAY:" + Build.DISPLAY;
		ret += ",FINGERPRINT:" + Build.FINGERPRINT;
		ret += ",HARDWARE:" + Build.HARDWARE;
		ret += ",HOST:" + Build.HOST;
		ret += ",ID:" + Build.ID;//Settings.Secure.getString(context.getActivity().getContentResolver(), "android_id")
		ret += ",MANUFACTURER:" + Build.MANUFACTURER;
		ret += ",MODEL:" + Build.MODEL;
		ret += ",PRODUCT:" + Build.PRODUCT;
		ret += ",SERIAL:" + Build.SERIAL;
		// final[] SUPPORTED_32_BIT_ABIS = null:" + Build.;
		// final[] SUPPORTED_64_BIT_ABIS = null:" + Build.;
		// final[] SUPPORTED_ABIS = null:" + Build.;
		ret += ",TAGS:" + Build.TAGS;
		// ret += ",long TIME = 0L:" + Build.;
		ret += ",TYPE:" + Build.TYPE;
		ret += ",USER:" + Build.USER;
		ret += ",VERSION_SDK:" + Build.VERSION.SDK_INT;
		ret += ",VERSION_RELEASE:" + Build.VERSION.RELEASE;
		ret += ",IMEI:" + imei;
		Log.w("LOG_TAG", "DeviceInfo: " + ret);
		return ret;
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
