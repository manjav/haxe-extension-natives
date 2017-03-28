extension-nativefunctions
=============

Simple OpenFL extension for accessing android native methods.

Currently implements methods to use the android vibrator and access screen
dimensions.

Install via 
`haxelib git extension-nativefunctions https://github.com/manjav/haxe-extension-nativefunctions`

Add to `project.xml`:

```xml
<haxelib name="extension-nativefunctions" if="android" />
```

And import into your project (haxe) with:
  
```Haxe
    import com.gerantech.extension.NativeFunctions;
```
Exposed methods are currently:

```Haxe
    public static function vibrate(int duration):Void;
    public static function wakeUp():Void;
```
More can be simply added in the java source file, replicating the function and
corresponding `JNI.createStaticMethod(...)` call in `NativeFunctions.hx`.
  
### Contributions

Thank you to [alagator](https://github.com/alagatar) for contributing `wakeUp()` and to [ktravis](https://github.com/ktravis/haxe-hardware) for extension sample !
