//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)
varying vec2 text_pos;


void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position.xyz, 1.0);
    
    text_pos = in_TextureCoord;
}


//######################_==_YOYO_SHADER_MARKER_==_######################@~//




// Fragment Shader
varying vec2 text_pos;
const vec3 lum_mod = vec3(0.2126, 0.7152, 0.0722);

void main()
{
    vec4 total_val = texture2D(gm_BaseTexture, text_pos);
    float alpha = total_val.a;
    float red = total_val.r;
    float green = total_val.g;
    float blue = total_val.b;
    
    red = red * green;
    blue = red * blue;
    green = green * blue;
    
    gl_FragColor = vec4(red, green, blue, alpha);
}
