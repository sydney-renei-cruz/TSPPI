/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//$(document).ready(function(){
//
//
//function validate() {
//    var password1 = $("#password").val();
//    var password2 = $("#confirm-password").val();
//
//    if(password1 === password2) {
//        $("#reg-password").css("border", "solid 1px #1CB94A");   
//        $("#confirm-password").css("border", "solid 1px #1CB94A"); 
//        $("#validation-box").val("Password matches");
//    }
//    else {
//        $("#reg-password").css("border", "solid 1px #e60000");   
//        $("#confirm-password").css("border", "solid 1px #e60000");
//        $("#validation-box").val(null);
//
//    }
//
//}
//
//   $('#register-submit').attr('disabled', 'disabled');
//   $('#register-form').keyup(function(){
//      $('#register-submit').attr('disabled', 'disabled'); 
//      var username = $('#username').val();
//      var password = $('#password').val();
//      var confpass = $('#confirm-password').val();
//      var firstname = $('#firs_tname').val();
//      var lastname = $('#last_name').val();
//      var email = $('#email').val();
//      var mobile = $('#mobile_number').val();
//      var telephone = $('#telephone_number').val();
//      var address = $('#address').val();
//      var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
//      if(!(username === "" || password === "" || confpass === "" || firstname === "" || lastname === ""
//              || email === "" || mobile === "" || telephone === "" || address === "")){
//          if(filter.test(email) && username.length > 3 && password.length > 5 && password === confpass &&
//                  mobile.length === 11 && telephone.length === 7){
//              $('#register-submit').removeAttr('disabled');
//          }
//      }
//   });
//   $("#confirm-password").keyup(validate);
//   
//   $('#register-submit').click(function(){
//       alert("Registration Complete! You will be redirected back to Log in Page");
//   });
//});

function countdown( elementName, minutes, seconds )
{
    var element, endTime, hours, mins, msLeft, time;

    function twoDigits( n )
    {
        return (n <= 9 ? "0" + n : n);
    }

    function updateTimer()
    {
        msLeft = endTime - (+new Date);
        if ( msLeft < 1000 ) {
            document.getElementById("register-form").submit();
        } else {
            time = new Date( msLeft );
            hours = time.getUTCHours();
            mins = time.getUTCMinutes();
            setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
        }
    }

    element = document.getElementById( elementName );
    endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
    updateTimer();
}

$(document).ready(function(){
   $("#register-form").validate({
       errorClass: "my-error-class",
       rules: {
            username: {
                required: true,
                minlength: 4,
                remote: {
                   url: 'checkusername', //UsernameCheckerController
                   type: 'post',
                   data: {
                       'username': function() { return $('#username').val(); }
                   }
               }
            },
            password: {
                required: true,
                minlength: 6
            },
            confirm_password: {
                required: true,
                equalTo: "#password"
            },
            first_name: "required",
            last_name: "required",
            email: {
                required: true,
                email: true,
                remote: {
                   url: 'checkemail', //EmailCheckerController
                   type: 'post',
                   data: {
                       'email': function() { return $('#email').val();}
                   }
               }
            },
            mobile_number: {
                required: true,
                minlength: 11,
                maxlength: 11
            },
            telephone_number: {
                required: true,
                minlength: 7,
                maxlength: 11
            },
            company_name: "required",
            company_branch: {
                required: true,
                remote: {
                    url: 'checkcompany',
                    type: 'post',
                    data: {
                        'company_name' : function() { return $('input[name="company_name"]').val(); },
                        'company_branch' : function() { return $('input[name="company_branch"]').val(); }
                    }
                    
                }
            }
       },
       messages: {
           username:{
               required: "Please enter a username",
               minlength: "Username must be atleast 4 characters",
               remote: "Username already exists"
            },
           password: {
               required: "Please enter a password",
               minlength: "Password must be atleast 6 characters"
           },
           confirm_password: {
               required: "Re-enter password",
               equalTo: "Password does not match, please re-enter password"
           },
           first_name: "Plese enter your first name",
           last_name: "Please enter your last name",
           email: {
               required: "Please enter an email adress",
               email: "Please enter a valid email address",
               remote: "Email already exists"
           },
           mobile_number: {
               required: "Please enter mobile number",
               minlength: "Mobile number should be atleast 11 digits",
               maxlength: "Mobile number should not exceed 11 digits"
           },
           telephone_number: {
               required: "Please enter telephone number",
               minlength: "Telephone number should be atleast 7 digits",
               maxlength: "Telephone number should not exceed 11 digits"
           },
           company_name: "Please enter company name",
           company_branch: {
               required: "Please enter company's branch",
               remote: "The Company is not yet registered in the system. To register the company, click <a href='requestcompany'>here</a>."
           }
       }
   });
   
   $("#register-submit").click(function(){
        if($("#register-form").valid()){
            $("#mssgBox").modal({backdrop: 'static', keyboard: false});
            countdown( "countdown", 0, 3 );
        }
    });
});