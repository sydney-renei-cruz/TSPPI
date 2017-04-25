/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
   $("#register-form").validate({
       errorClass: "my-error-class",
       rules: {
            username: {
                required: true,
                minlength: 4
            },
            password: {
                required: true,
                minlength: 6
            },
            confirm_password: {
                required: true,
                equalTo: "#password"
            },
            email: {
                required: true,
                email: true,
                gmailOnly: true
            }
       },
       messages: {
           username:{
               required: "Please enter a username",
               minlength: "Username must be atleast 4 characters"
            },
           password: {
               required: "Please enter a password",
               minlength: "Password must be atleast 6 characters"
           },
           confirm_password: {
               required: "Re-enter password",
               equalTo: "Password does not match, please re-enter password"
           },
           email: {
               required: "Please enter an email adress",
               email: "Please enter a valid email address"
           }
       }
   });
});