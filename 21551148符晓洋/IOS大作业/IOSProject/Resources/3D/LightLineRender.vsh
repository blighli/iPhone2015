// Attributes
attribute vec3 a_position;
attribute vec3 a_normal;
attribute vec2 a_texCoord;

// Varyings
//varying vec2 v_texCoord;
#ifdef GL_ES
varying mediump vec2 v_texCoord;
#else
varying vec2 v_texCoord;
#endif



void main()
{
    gl_Position = CC_MVPMatrix * vec4(a_position, 1.0);
    v_texCoord = a_texCoord;
}
