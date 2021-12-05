function resetInput(){
  $('#AddBrand').val("");
}

function getBrand(idbr){
  console.log(idbr);
  $.ajax({
    type: "POST",
    url:"action/EditBrand.php",
    data:{idbr:idbr}
  }).done(function(data){
    document.getElementById("model-brand").innerHTML=data;
    console.log(data);
}
  )}

  $('#buttonupdateBrand').click(function(){
    let brand=$('#AddBrand').val();
    console.log(brand);
    if(document.getElementById("buttonAddBrand")="")
    $.ajax({
      type: "POST",
      url: "action/modelupdatebrand.php",
      data: { brand: brand }
    }).done(function(data){
      //xem lại vị trí trang hiện tại
      if (data == 1) {
        callSnackbar("Lưu vào thành công", 1);
        resetInput();
      } else {
        //alert("no");
        callSnackbar("Lưu vào không thành công", 2);
      }
      });
});


$('#buttonAddBrand').click(function(){
        let brand=$('#AddBrand').val();
        console.log(brand);
        $.ajax({
          type: "POST",
          url: "action/addNewBrand.php",
          data: { brand: brand }
        }).done(function(data){
          //xem lại vị trí trang hiện tại
          if (data == 1) {
            //alert("yes");
            if(document.getElementById!=0){
            $.ajax({
              type: "GET",
              url: "action/UpdatenewBrand.php"
            }).done(function(data) {
              console.log(data);
              $("#table_product").append(data);
            });
            callSnackbar("Thêm vào thành công", 1);
            resetInput();
          } else {
            //alert("no");
            callSnackbar("Thêm vào không thành công", 2);
          }
        }
          });
  });
function deletebrand(brand){
    //let brand=$('#delete').val();
    console.log(brand);
    $.ajax({
      type: "POST",
      url: "action/deletebrand.php",
      data: { brand: brand }
    }).done(function(data){
      //xem lại vị trí trang hiện tại
      if (data == 1) {
        //alert("yes");
        callSnackbar("Xóa thành công", 1);
    }
      });
};