#version 150
#moj_import <fog.glsl>
in vec3 Position;in vec4 Color;in vec2 UV0;in ivec2 UV2;uniform sampler2D Sampler0,Sampler2;uniform mat4 ModelViewMat,ProjMat;uniform float GameTime;out float vertexDistance;out vec4 vertexColor;out vec2 texCoord0;void main(){gl_Position=ProjMat*ModelViewMat*vec4(Position,1.);vertexDistance=cylindrical_distance(ModelViewMat,Position);if(Color.xyz==vec3(1.,84./255.,1./3.))vertexColor=vec4(vec3(1.,1./3.,1./3.),abs(mod(GameTime*16000.,20.)-10.)/10.);else if(Color.xyz==vec3(254./255.,1.,1.))vertexColor=vec4(1.);else if(Color.xyz==vec3(0.,0.,170.)/255.)vertexColor=vec4(int(floor(max(mod(GameTime*12000.,50.)-46.,0.)))==int(mod(floor(texture(Sampler0,UV0).z*255.),4.)));else vertexColor=Color*texelFetch(Sampler2,UV2/16,0);texCoord0=UV0;}