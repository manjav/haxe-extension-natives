package com.gerantech.extension.enums;

/**
 * ...
 * @author Mansour Djawadi
 */

@:enum
abstract TelephonyState(Int)
{
	var IDLE = 0;
	var RINGING = 1;
	var OFFHOOK = 2;
}