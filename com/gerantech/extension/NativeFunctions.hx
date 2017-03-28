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

}
