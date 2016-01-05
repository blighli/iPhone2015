uniform sampler2D u_texture1;
uniform sampler2D u_lightTexture;   
uniform vec4 v_LightColor;
uniform vec2 v_animLight;     
varying vec2 v_texCoord;

void main(void) 
{
    vec4 lightcolor = texture2D(u_lightTexture, v_texCoord + v_animLight.xy) * v_LightColor;
	gl_FragColor = texture2D(u_texture1, v_texCoord) + lightcolor;
}
