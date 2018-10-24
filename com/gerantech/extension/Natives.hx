package com.gerantech.extension;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end
#if (android && openfl)
import lime.system.JNI;
#end

enum abstract ToastDuration(Int) {
	var short = 0;
	var long = 1;
}

class Natives {
	#if (android && openfl)
	private static var vibrate_jni = JNI.createStaticMethod("com.gerantech.extension.Natives", "vibrate", "(I)V");
	private static var wakeUp_jni = JNI.createStaticMethod("com.gerantech.extension.Natives", "wakeUp", "()V");
	private static var toast_jni = JNI.createStaticMethod("com.gerantech.extension.Natives", "toast", "(Ljava/lang/String;I)V");
	private static var intent_jni = JNI.createStaticMethod("com.gerantech.extension.Natives", "runIntent", "(ILjava/lang/String;Ljava/lang/String;)V");
	#end

	public static function vibrate(inputValue:Int) {
		#if (android && openfl)
		vibrate_jni(inputValue);
		#end
	}

	public static function wakeUp():Void {
		#if (android && openfl)
		wakeUp_jni();
		#end
	}

	public static function toast(text:String, duration:ToastDuration):Void {
		#if (android && openfl)
		toast_jni(text, duration);
		#end
	}

	public static function shareText(subject:String, text:String):Void {
		#if (android && openfl)
		intent_jni(0, subject, text);
		#end
	}
		#end
	}
}
