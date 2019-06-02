//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float flicker;

//uniform int shaderMode;

void main()
{
	
	float PI = 3.1415;
	float lens = 8.0;
	float dist = pow(distance(vec2(0.5,0.5),v_vTexcoord),lens);
	//if (shaderMode == 1){
	//	dist = 0.0;
	//}
	dist = 0.0;
	float adjX = (v_vTexcoord.x-0.5)*(1.0+dist*0.7)+0.5;
	float adjY = (v_vTexcoord.y-0.5)*(1.0+dist*0.7)+0.5;
	float alpha = 1.0;
	//if (adjY > 0.0 && adjY < 1.0){
	//	if (adjX > 0.0 && adjX < 1.0){ 
	//		if (adjX < 0.0){
	//			adjY = (adjY - 0.5)/(1.0-adjX*1.5)+0.5;
	//			adjX = adjX *-1.0;
	//			alpha = 0.2;
		
	//		}
	//		if (adjX > 1.0){
	//			adjY = (adjY - 0.5)*(2.0-adjX)+0.5;
	//			adjX = 1.0 - (adjX - 1.0);
		
	//			alpha = 0.2;
	//		}
	//	}
	//} 
	
	vec2 adjustedTexcoord = vec2(adjX,adjY);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, adjustedTexcoord );
	vec4 bloomL = v_vColour * texture2D( gm_BaseTexture, adjustedTexcoord - vec2(1.0/240.0,0.0))*5.0;
	vec4 bloomR = v_vColour * texture2D( gm_BaseTexture, adjustedTexcoord + vec2(1.0/240.0,0.0))*5.0;
	vec4 bloomU = v_vColour * texture2D( gm_BaseTexture, adjustedTexcoord - vec2(0.0,1.0/160.0));
	vec4 bloomD = v_vColour * texture2D( gm_BaseTexture, adjustedTexcoord + vec2(0.0,1.0/160.0));
	float lightBoost = gl_FragColor.r+gl_FragColor.g+gl_FragColor.b;
	float yOffset = float(int((adjustedTexcoord.x * 640.0)/3.0))/640.0;
	float pixelLight = abs(cos(adjustedTexcoord.x * 240.0 *PI + 1.5*PI))*abs(cos((adjustedTexcoord.y) * 160.0 * PI+1.5*PI))+0.1-dist*lens*0.7 + flicker;
	
	float lightL = (bloomL.r+bloomL.g+bloomL.b)/3.0;
	if(bloomL.x < 0.0 || bloomL.x > 1.0){
		lightL = 0.0;
	}
	float lightR = (bloomR.r+bloomR.g+bloomR.b)/3.0;
	if(bloomR.x < 0.0 || bloomR.x > 1.0){
		lightR = 0.0;
	}
	float lightU = (bloomU.r+bloomU.g+bloomU.b)/3.0;
	if(bloomU.y < 0.0 || bloomU.y > 1.0){
		lightU = 0.0;
	}
	float lightD = (bloomD.r+bloomD.g+bloomD.b)/3.0;
	if(bloomD.y < 0.0 || bloomD.y > 1.0){
		lightD = 0.0;
	}
	
	float neighbourlight = lightL+lightR+lightU+lightD/4.0;
	
	
	//gl_FragColor.r = gl_FragColor.r * pixelLight;//(pixelLight + neighbourlight*.02);
	//gl_FragColor.g = gl_FragColor.g * pixelLight;//(pixelLight + neighbourlight*.02);
	//gl_FragColor.b = gl_FragColor.b * pixelLight;//(pixelLight + neighbourlight*.02);
	float brightness = 1.8;
	gl_FragColor.r = (gl_FragColor.r * pixelLight + neighbourlight*.02) * brightness;
	gl_FragColor.g = (gl_FragColor.g * pixelLight + neighbourlight*.02) * brightness;
	gl_FragColor.b = (gl_FragColor.b * pixelLight + neighbourlight*.02) * brightness;
	
	
	
	//gl_FragColor = vec4(yiq2rgb*yFinalColor, 1.0);

	//if (int(mod((adjustedTexcoord.x*1024.0),3.0)) == 0){
	//	gl_FragColor.r = gl_FragColor.r * 0.6;
	//	gl_FragColor.g = gl_FragColor.g * 0.6;
	//}
	//if (int(mod((adjustedTexcoord.x*1024.0),3.0)) == 1){
	//	gl_FragColor.g = gl_FragColor.g * 0.6;
	//	gl_FragColor.b = gl_FragColor.b * 0.6;
	//}
	//if (int(mod((adjustedTexcoord.x*1024.0),3.0)) == 2){
	//	gl_FragColor.b = gl_FragColor.b * 0.6;
	//	gl_FragColor.r = gl_FragColor.r * 0.6;
	//}
	gl_FragColor.a = alpha;
	
	if (adjX < 0.0 || adjX > 1.0 || adjY < 0.0 || adjY > 1.0){
		gl_FragColor.a = 0.0;		
	}
}
