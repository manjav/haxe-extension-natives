package com.gerantech.extension;

/**
 * ...
 * @author Mansour Djawadi
 */
#if cpp
import cpp.Lib;
#elseif neko
#end
#if (android && openfl)
import lime.system.JNI;
#end

enum abstract TelephonyState(Int) {
	var IDLE = 0;
	var RINGING = 1;
	var OFFHOOK = 2;
}

class NativeTelephony {
	#if (android && openfl)
	private static var addListener_jni = JNI.createStaticMethod("com.gerantech.extension.NativeTelephony", "addListener", "(Lorg/haxe/lime/HaxeObject;)V", true);
	private static var deviceinfo_jni = JNI.createStaticMethod("com.gerantech.extension.NativeTelephony", "getDeviceInfo", "()Ljava/lang/String;");
	#end

	private static var _instance:NativeTelephony;

	private var callback:TelephonyState->Void;
	private var _device:Device;

	public function new() {}

	public function addCallback(callback:TelephonyState->Void):Void {
		this.callback = callback;
		#if (android && openfl)
		return addListener_jni([this]);
		#end
	}

	public function onCallStateChanged(state:Int):Void {
		callback(cast(state, TelephonyState));
	}

	public var device(get, never):Device;

	private function get_device():Device {
		#if (android && openfl)
		if (_device == null)
			_device = new Device(deviceinfo_jni());
		#end
		return _device;
	}

	public static var instance(get, never):NativeTelephony;

	private static function get_instance():NativeTelephony {
		if (_instance == null)
			_instance = new NativeTelephony();
		return _instance;
	}
}
