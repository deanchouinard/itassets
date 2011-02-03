function sel_controller() {
  var sel_index = document.new_lookup.lookup[0].selectedIndex;
  var list_val = document.new_lookup.lookup["lu_key"][sel_index].text; 
  
  alert (list_val);
  
  if ( list_val == "Add Item" ) {
    document.new_lookup.lookup_value.value = '';
    document.new_lookup.lookup_value.disabled = false; }
  else {
    document.new_lookup.lookup_value.value = list_val;
    document.new_lookup.lookup_value.disabled = true;
  }
}
window.onload = sel_controller;
