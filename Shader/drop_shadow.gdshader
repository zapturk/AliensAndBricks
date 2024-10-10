shader_type canvas_item;

uniform vec4 background_color : source_color;
uniform vec4 shadow_color : source_color;
// Currently pixels always in application size, so zooming in further wouldn't increase the size of the dropdown
// but changing that would also be relatively trivial
uniform vec2 offset_in_pixels;

void fragment() {

	// Read screen texture
	vec4 current_color = texture(TEXTURE, UV);

	if (COLOR.a == 0.00)
		discard;

	if(COLOR != background_color){
		current_color = shadow_color;
	}

	COLOR = current_color;
}