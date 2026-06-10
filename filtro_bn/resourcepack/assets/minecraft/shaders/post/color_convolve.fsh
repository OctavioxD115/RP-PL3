#version 330

uniform sampler2D InSampler;

in vec2 texCoord;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};

layout(std140) uniform ColorConfig {
    vec3 RedMatrix;
    vec3 GreenMatrix;
    vec3 BlueMatrix;
};

// Fórmula matemática exacta de luminancia para blanco y negro perfecto
const vec3 Gray = vec3(0.2126, 0.7152, 0.0722);

out vec4 fragColor;

void main() {
    // Tomamos el color original del píxel de la pantalla
    vec4 InTexel = texture(InSampler, texCoord);

    // Calculamos el valor gris del píxel multiplicándolo por los pesos de luminancia
    float GrayValue = dot(InTexel.rgb, Gray);
    
    // Creamos el color final usando el mismo valor gris para los canales Rojo, Verde y Azul
    vec3 OutColor = vec3(GrayValue);

    // Mandamos el píxel gris a la pantalla con su opacidad original (1.0)
    fragColor = vec4(OutColor, 1.0);
}