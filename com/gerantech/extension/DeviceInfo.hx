package com.gerantech.extension;

enum abstract DeviceSpec(String) {
	final BOARD;
	final BOOTLOADER;
	final BRAND;
	final DEVICE;
	final DISPLAY;
	final FINGERPRINT;
	final HARDWARE;
	final HOST;
	final ID;
	final MANUFACTURER;
	final MODEL;
	final PRODUCT;
	final SERIAL;
	// final[] SUPPORTED_32_BIT_ABIS = null;
	// final[] SUPPORTED_64_BIT_ABIS = null;
	// final[] SUPPORTED_ABIS = null;
	final TAGS;
	// final long TIME = 0L;
	final TYPE;
	final USER;
	final VERSION_SDK;
	final VERSION_RELEASE;
	final IMEI;
}

class DeviceInfo {
	private final map:Map<DeviceSpec, String> = new Map();

	public function new(data:String) {
		var list = data.split(",");
		for (i in list) {
			var kv = i.split(":");
			this.map[cast(kv[0], DeviceSpec)] = kv[1];
		}
	}

	public function get(key:DeviceSpec):String {
		return this.map.get(key);
	}

	public function toString():String {
		var result = "";
		for (key in this.map.keys())
			result += (key + ";" + this.map[key] + " ");
		return result;
	}
}
