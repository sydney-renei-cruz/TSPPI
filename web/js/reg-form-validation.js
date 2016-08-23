/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
   $('#register-submit').attr('disabled', 'disabled');
   $('#register-form').keyup(function(){
      $('#register-submit').attr('disabled', 'disabled'); 
      var username = $('#username').val();
      var password = $('#password').val();
      var confpass = $('#confirm-password').val();
      var firstname = $('#firs_tname').val();
      var lastname = $('#last_name').val();
      var email = $('#email').val();
      var mobile = $('#mobile_number').val();
      var telephone = $('#telephone_number').val();
      var address = $('#address').val();
      var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
      if(!(username === "" || password === "" || confpass === "" || firstname === "" || lastname === ""
              || email === "" || mobile === "" || telephone === "" || address === "")){
          if(filter.test(email) && username.length > 3 && password.length > 5 && password === confpass &&
                  mobile.length === 11 && telephone.length === 7){
              $('#register-submit').removeAttr('disabled');
          }
      }
   });
   $("#confirm-password").keyup(validate);
   
   $('#register-submit').click(function(){
       alert("Registration Complete! You will be redirected back to Log in Page");
   });
});


function validate() {
    var password1 = $("#password").val();
    var password2 = $("#confirm-password").val();

    if(password1 === password2) {
        $("#reg-password").css("border", "solid 1px #1CB94A");   
        $("#confirm-password").css("border", "solid 1px #1CB94A"); 
        $("#validation-box").val("Password matches");
    }
    else {
        $("#reg-password").css("border", "solid 1px #e60000");   
        $("#confirm-password").css("border", "solid 1px #e60000");
        $("#validation-box").val(null);

    }

  }