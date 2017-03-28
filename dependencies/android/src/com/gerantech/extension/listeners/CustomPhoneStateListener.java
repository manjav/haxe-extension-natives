package com.gerantech.extension.listeners;

import org.haxe.lime.HaxeObject;

import android.app.Activity;
import android.telephony.PhoneStateListener;


public class CustomPhoneStateListener extends PhoneStateListener 
{
	private HaxeObject callback;
	
    public CustomPhoneStateListener(Activity activity, HaxeObject callback)
    {
        super();
        this.callback = callback;
    }

    @Override
    public void onCallStateChanged(final int state, String incomingNumber) 
    {
        super.onCallStateChanged(state, incomingNumber);

        /*switch (state) {
        case TelephonyManager.CALL_STATE_IDLE:
            //when Idle i.e no call
            Toast.makeText(context, "Phone state Idle", Toast.LENGTH_LONG).show();
            break;
        case TelephonyManager.CALL_STATE_RINGING:
            //when Ringing
            //Toast.makeText(context, "Phone state Ringing", Toast.LENGTH_LONG).show();
            break;
        case TelephonyManager.CALL_STATE_OFFHOOK:
            //when Off hook i.e in call
            //Make intent and start your service here
            Toast.makeText(context, "Phone state Off hook", Toast.LENGTH_LONG).show();
            break;
        default:
            break;
        }*/
        callback.call("onCallStateChanged", new Object[] {state});
    }
}