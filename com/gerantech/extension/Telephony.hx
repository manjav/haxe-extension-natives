package com.gerantech.extension;

import com.gerantech.extension.Telephony;
import com.gerantech.extension.enums.TelephonyState;

/**
 * ...
 * @author Mansour Djawadi
 */

#if cpp
	import cpp.Lib;
#elseif neko
#end

#if (android && openfl)
	import openfl.utils.JNI;
#end

class Telephony
{

	#if (android && openfl)
	private static var getIMEI_jni = JNI.createStaticMethod ("com.gerantech.extension.TelephonyFunctions", "getIMEI", "()Ljava/lang/String;");
	private static var addListener_jni = JNI.createStaticMethod("com.gerantech.extension.TelephonyFunctions", "addListener", "(Lorg/haxe/lime/HaxeObject;)V", true);
	#end

	private static var _instance:Telephony;
	private var callback:TelephonyState->Void;

	public function new()
	{
	}

	public function getIMEI():String
	{
		#if (android && openfl)
		return getIMEI_jni();
		#end
		return null;
	}

	public function addCallback(callback:TelephonyState->Void):Void
	{
		this.callback = callback;
		#if (android && openfl)
		return addListener_jni([this]);
		#end
	}

	public function onCallStateChanged(state:Int):Void
	{
		callback(cast(state, TelephonyState));
	}

	public static function getInstance():Telephony
	{
		if (_instance == null)
			_instance = new Telephony();
		return _instance;
	}
}