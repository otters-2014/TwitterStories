$(document).ready(function() {
  console.log("#sortable");
$("#sortable").sortable( { axis: "y"}).sortable("refreshPositions");
$("#sortable").disableSelection();
})
