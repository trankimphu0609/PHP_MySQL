function moreUser(id) {
  $.ajax({
    type: "GET",
    url: "action/getMoreUser.php",
    data: { id: id }
  }).done(function(data) {
    $("#formMoreUser").html(data);
  });
}
// $('#AddUser').click(function(){
 
// });
function permiss(id){
  $.ajax({
    type: "POST",
    url: "action/permiss.php",
    data: {id: id}
  }).done(function(data){
    window.location.assign("?page=customer");
    if(data==1){
      callSnackbar("cấp quyền thành công",1);
    }else{
      callSnackbar("hủy quyền thành công",1);
    }
  })
}