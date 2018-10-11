package com.gerantech.extension;

class DeviceInfo {
	public var sdkVersion:Int;
	public var model:String;
	public var manufacturer:String;
	public var device:String;
	public var product:String;
	public var brand:String;
	public var id:String;
	public var imei:String;

	public function new(a:Array<String>) {
		if (a != null && a.length == 8)
			update(Std.parseInt(a[0]), a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
	}

	private function update(sdkVersion:Int, model:String, manufacturer:String, device:String, product:String, brand:String, id:String, imei:String):Void {
		this.sdkVersion = sdkVersion;
		this.model = model;
		this.manufacturer = manufacturer;
		this.device = device;
		this.product = product;
		this.brand = brand;
		this.id = id;
		this.imei = imei;
	}

	public function toString():String {
		return "sdkVersion:" + sdkVersion + " model:" + model + " manufacturer:" + manufacturer + " device:" + device + " product:" + product + " brand:"
			+ brand + " id:" + id + " imei:" + imei;
	}
}
