shader_type spatial;

uniform sampler2D face_1 : source_color;
uniform sampler2D face_2 : source_color;
uniform sampler2D face_3 : source_color;
uniform sampler2D face_4 : source_color;
uniform sampler2D face_5 : source_color;
uniform sampler2D face_6 : source_color;

void fragment() {
    vec3 normal = abs(NORMAL);
    vec4 color = vec4(0.0);
    
    // Front face (positive Z) - face 1
    if (normal.z > 0.9 && NORMAL.z > 0.0) {
        color = texture(face_1, UV);
    }
    // Back face (negative Z) - face 6
    else if (normal.z > 0.9 && NORMAL.z < 0.0) {
        color = texture(face_6, UV);
    }
    // Right face (positive X) - face 2
    else if (normal.x > 0.9 && NORMAL.x > 0.0) {
        color = texture(face_2, UV);
    }
    // Left face (negative X) - face 5
    else if (normal.x > 0.9 && NORMAL.x < 0.0) {
        color = texture(face_5, UV);
    }
    // Top face (positive Y) - face 3
    else if (normal.y > 0.9 && NORMAL.y > 0.0) {
        color = texture(face_3, UV);
    }
    // Bottom face (negative Y) - face 4
    else if (normal.y > 0.9 && NORMAL.y < 0.0) {
        color = texture(face_4, UV);
    }
    
    ALBEDO = color.rgb;
    ALPHA = color.a;
}