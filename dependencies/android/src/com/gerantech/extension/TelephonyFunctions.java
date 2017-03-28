package com.gerantech.extension;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

import com.gerantech.extension.listeners.CustomPhoneStateListener;

import android.content.Context;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;

public class TelephonyFunctions extends Extension
{
	private static TelephonyManager manager;
	private static CustomPhoneStateListener listener;

	public static String getIMEI()
	{
		return getManager().getDeviceId();
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
		if(manager == null)
			manager = (TelephonyManager) mainContext.getSystemService(Context.TELEPHONY_SERVICE);

		return manager;
	}
}
