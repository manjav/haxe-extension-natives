package com.gerantech.extension;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end

class NativeFunctions 
{
    #if (android && openfl)
    private static var vibrate_jni = JNI.createStaticMethod ("com.gerantech.extension.NativeFunctions", "vibrate", "(I)V");
    private static var wakeUp_jni = JNI.createStaticMethod ("com.gerantech.extension.NativeFunctions", "wakeUp", "()V");
    private static var get_screen_width_jni = JNI.createStaticMethod ("com.gerantech.extension.NativeFunctions", "getScreenWidth", "()I");
    private static var get_screen_height_jni = JNI.createStaticMethod ("com.gerantech.extension.NativeFunctions", "getScreenHeight", "()I");
    #end

    public static function vibrate(inputValue:Int)
    {
        #if (android && openfl)
        vibrate_jni(inputValue);
        #end
    }

    public static function wakeUp():Void
    {
        #if (android && openfl)
        wakeUp_jni();
        #end
    }

    public static function getScreenWidth():Int
    {
        var out = -1;
        #if (android && openfl)
        out = get_screen_width_jni();
        #end
        return out;
    }

    public static function getScreenHeight():Int
    {
        var out = -1;
        #if (android && openfl)
        out = get_screen_height_jni();
        #end
        return out;
    }
}
