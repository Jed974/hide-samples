package shaders;

class Dissolve extends hxsl.Shader {

	static var SRC = {
		var pixelColor : Vec4;
		
		@perInstance @param var progress : Float = 1.0;
		@perInstance @param var saturation : Float = 0.0;
		@perInstance @param var width : Float = 1.0;

		function fragment() {
			var edge = mix(1.0 + width, -width, progress);
			var ramp = saturate((1.0 + saturation) * (width - abs(edge - pixelColor.r)) / width);
			pixelColor.a *= ramp;
		}
	};
}