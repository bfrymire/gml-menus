global.pause = true;

global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

global.key_revert = ord("X");
global.key_enter = vk_enter;
global.key_left = vk_left;
global.key_right = vk_right;
global.key_up = vk_up;
global.key_down = vk_down;

display_set_gui_size(global.view_width, global.view_height);

enum menu_page {
	main,
	settings,
	audio,
	difficulty,
	graphics,
	controls,
	height
}

// create menu pages
ds_menu_main = create_menu_page(
	["RESUME", MENU_ELEMENT_TYPE.SCRIPT_RUNNER, resume_game],
	["SETTINGS", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.settings],
	["EXIT", MENU_ELEMENT_TYPE.SCRIPT_RUNNER, exit_game],
);

ds_menu_settings = create_menu_page(
	["AUDIO", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.audio],
	["DIFFICULTY", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.difficulty],
	["GRAPHICS", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.graphics],
	["CONTROLS", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.controls],
	["BACK", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.main],
);

ds_menu_audio = create_menu_page(
	["MASTER", MENU_ELEMENT_TYPE.SLIDER, change_volume, 0.5, [0,1]],
	["SOUNDS", MENU_ELEMENT_TYPE.SLIDER, change_volume, 0.2, [0,1]],
	["MUSIC", MENU_ELEMENT_TYPE.SLIDER, change_volume, 1, [0,1]],
	["BACK", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.settings],
);

ds_menu_difficulty = create_menu_page(
	["ENEMIES", MENU_ELEMENT_TYPE.SHIFT, change_difficulty, 0, ["HARMLESS", "NORMAL", "TERRIBLE"]],
	["ALLIES", MENU_ELEMENT_TYPE.SHIFT, change_difficulty, 0, ["DIM-WITTED", "NORMAL", "HELPFUL"]],
	["BACK", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.settings],
);

ds_menu_graphics = create_menu_page(
	["RESOLUTION", MENU_ELEMENT_TYPE.SHIFT, change_resolution, 0, ["384 x 216", "768 x 432", "1152 x 648", "1536 x 874", "1920 x 1080"]],
	["WINDOW MODE", MENU_ELEMENT_TYPE.TOGGLE, change_window_mode, 1, ["FULLSCREEN", "WINDOWED"]],
	["BACK", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.settings],
);

ds_menu_controls = create_menu_page(
	["UP", MENU_ELEMENT_TYPE.INPUT, "key_up", vk_up],
	["LEFT", MENU_ELEMENT_TYPE.INPUT, "key_left", vk_left],
	["RIGHT", MENU_ELEMENT_TYPE.INPUT, "key_right", vk_right],
	["DOWN", MENU_ELEMENT_TYPE.INPUT, "key_down", vk_down],
	["BACK", MENU_ELEMENT_TYPE.PAGE_TRANSFER, menu_page.settings],
);

page = 0;
menu_pages = [
	ds_menu_main,
	ds_menu_settings,
	ds_menu_audio,
	ds_menu_difficulty,
	ds_menu_graphics,
	ds_menu_controls,
];

var i = 0;
var array_len = array_length_1d(menu_pages);
repeat (array_len) {
	menu_option[i] = 0;
	i++;
}

inputting = false;

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sound_effects);