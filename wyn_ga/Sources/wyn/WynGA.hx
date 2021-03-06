package wyn;

// For reference of API usage:
// https://developers.google.com/analytics/devguides/collection/analyticsjs/command-queue-reference

#if js

// Note: extern class means this WynGA doesn't exist in
// the code -- it tries to link directly to the native class,
// e.g. window.wyn_ga.sendEvent(...); and assumes it exists.
@:native('wyn_ga')
extern class WynGA
{
	public static function init (id:String, name:String, enableAdvertisingTracking:Bool) : Void;
	public static function sendEvent (name:String, category:String, action:String, label:String, value:String) : Void;
	public static function sendSocial (name:String, network:String, action:String, target:String) : Void;
	public static function sendTiming (name:String, category:String, variable:String, value:String, label:String) : Void;
}

#elseif (sys_ios || sys_android_native)

@:headerCode('
#include <WynGAKore.h>
')

class WynGA
{
	// NOTE 2016-05-26: additional tracking are unimplemented on all targets except js
	@:functionCode('WynGAKore::init(id, name, enableAdvertisingTracking);')
	public static function init (id:String, name:String, enableAdvertisingTracking:Bool) : Void {}

	@:functionCode('WynGAKore::sendEvent(name, category, action, label, value);')
	public static function sendEvent (name:String, category:String, action:String, label:String, value:String) : Void {}

	@:functionCode('WynGAKore::sendSocial(name, network, action, target);')
	public static function sendSocial (name:String, network:String, action:String, target:String) : Void {}

	@:functionCode('WynGAKore::sendTiming(name, category, variable, value, label);')
	public static function sendTiming (name:String, category:String, variable:String, value:String, label:String) : Void {}
}

#else

class WynGA
{
	// NOTE 2016-05-26: additional tracking are unimplemented on all targets except js
	public static function init (id:String, name:String, enableAdvertisingTracking:Bool) : Void {}
	public static function sendEvent (name:String, category:String, action:String, label:String, value:String) : Void {}
	public static function sendSocial (name:String, network:String, action:String, target:String) : Void {}
	public static function sendTiming (name:String, category:String, variable:String, value:String, label:String) : Void {}
}

#end
