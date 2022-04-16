var i = 0;
var _len = array_length(menu_pages);
repeat (_len) {
	ds_grid_destroy(menu_pages[i]);
	++i;
}
