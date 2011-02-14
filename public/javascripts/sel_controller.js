function sel_controller() {
  var key_select = document.getElementById("lookup_lu_key")
  var key_value = document.getElementById("new_key")
  var sel_index = key_select.selectedIndex;
  var list_val = key_select[sel_index].text; 
  
  // alert (list_val);
  
  if ( list_val == "Add New Key" ) {
    key_value.value = '';
    key_value.disabled = false; }
  else {
    key_value.value = '';
    key_value.disabled = true;
  }
}
window.onload = sel_controller;
