/// @description create_menu_page
/// @arg ["Name1", type1, entries1...]
function create_menu_page() {

	var arg;
	var i = 0;

	repeat (argument_count) {
		arg[i] = argument[i]
		++i;
	}

	var ds_grid_id = ds_grid_create(5, argument_count);

	i = 0;
	repeat (argument_count) {
		var array = arg[i];
		var _len = array_length(array);
	
		var xx = 0;
		repeat (_len) {
			ds_grid_id[# xx, i] = array[xx];
			xx++;
		}
		++i;
	}

	return ds_grid_id;


}
