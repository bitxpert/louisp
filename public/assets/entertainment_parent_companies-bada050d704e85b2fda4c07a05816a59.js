window.onload = function() {
//$("#entertainment_country").select2();
//$("#entertainment_parent_company_country").select2();
//$("#entertainment_function").select2();
//$("#entertainment_representative_name").attr("disabled","disabled") 
 $("input[value='Create Entertainment parent company']").click(
      function(event) {
        event.preventDefault();
        alert("asd");
        $(".representative_name").removeAttr("disabled")
        $(".representative_id").removeAttr("disabled")
        $("#entertainment_category").removeAttr("disabled")
        $("#entertainment_sub_category").removeAttr("disabled")
        $("#entertainment_icon").removeAttr("disabled")
        $("#entertainment_ee_user_id").removeAttr("disabled")
        $("#entertainment_password").removeAttr("disabled")
        $('#new_entertainment').submit();
      }
    );
/*$(".DAP1-info").hide()
$(".DAP1_btn").click(function(){
  $(".DAP1_btn").hide(100);   
  $(".DAP1-info").show(600);
}); 
*/

};
