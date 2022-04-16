function change_window_mode(argument0) {
	// 0=full 1=windowed

	switch (argument0) {
	
		case 0:
			window_set_fullscreen(true);
			break;
		
		case 1:
			window_set_fullscreen(false);
			break;
	}


}
