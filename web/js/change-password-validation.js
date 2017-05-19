/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
   $("#register-form").validate({
       errorClass: "my-error-class",
       rules: {
            current_password: "required",
            new_password: {
                required: true,
                minlength: 6
            },
            confirm_password: {
                required: true,
                equalTo: "#new_password"
            }
       },
       messages: {
           current_password: "Please enter your current password",
           new_password: {
               required: "Please enter new password",
               minlength: "Password must be atleast 6 characters"
           },
           confirm_password: {
               required: "Re-enter new password",
               equalTo: "Password does not match, please re-enter new password"
           }
       },
      submitHandler: function(form){
           $('input[type="submit"]').attr("disabled", true);
           form.submit();
       }
   }); 
   
});